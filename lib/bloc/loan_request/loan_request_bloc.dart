import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:e_bidir/repositories/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
import '../../data/model/person.dart';
part 'loan_request_state.dart';
part 'loan_request_event.dart';

class LoanRequestBloc extends Bloc<LoanRequestEvent, LoanRequestState> {
  final UserRepo userRepo;

  LoanRequestBloc({required this.userRepo})
      : super(LoanRequestState(errorMessage: '')) {
    on<GetPersonalInfo>(_mapGetUserProfileEventToState);
  }

  void _mapGetUserProfileEventToState(
      event, Emitter<LoanRequestState> emit) async {
    Person person;
    emit(state.copyWith(
        personalStatus: PersonalProfileStatus.loading, errorMessage: ''));
    try {
      Response response = await userRepo.getPersonalInfo();

      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      person = json.decode(response.body);
      emit(state.copyWith(
          PersonalProfileStatus: PersonalProfileStatus.success,
          personalInfo: person,
          errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          PersonalProfileStatus: PersonalProfileStatus.error,
          errorMessage: e.toString()));
    }
  }
}
//   RecommendationMezmurBloc({required this.mezmursRepository}) : super(LoadingState()){
//     on<RecommendationEvent>((event, emit) async {
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs(true);
//
//         emit(LoadingState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//
//       try{
//
//         final recommendMezmurs = await mezmursRepository.getMezmurs();
//
//         emit(LoadedState(recommendMezmurs));
//       }catch(e){
//
//         emit(ErrorState(e.toString()));
//       }
//     });
// }

