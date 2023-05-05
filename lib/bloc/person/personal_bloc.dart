import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/data/model/person.dart';
import 'package:e_bidir/repositories/user_repo.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
import '../../data/model/economic-second.dart';
import '../../data/model/economic.dart';
import '../../data/model/user_profile.dart';
part 'personal_state.dart';
part 'personal_event.dart';

class PersonBloc extends Bloc<PersonalEvent, PersonalState> {
  final UserRepo userProfileRepo;

  PersonBloc({required this.userProfileRepo})
      : super(PersonalState(errorMessage: '')) {
    on<UpdatePersonalProfile>(_mapGetUserProfileEventToState);
  }

  void _mapGetUserProfileEventToState(
      event, Emitter<PersonalState> emit) async {
    emit(state.copyWith(
        personalStatus: PersonalProfileStatus.initial, errorMessage: ''));
    try {
      emit(state.copyWith(
          personalStatus: PersonalProfileStatus.loading, errorMessage: ''));
      Response? userProfileResponse = await userProfileRepo.updatePersonalInfo(event.person);


      emit(state.copyWith(
          personalStatus: PersonalProfileStatus.success, errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          personalStatus: PersonalProfileStatus.error,
          errorMessage: e.toString()));
    }
  }
}



// class EconomicBloc extends Bloc<PersonalEvent, EconomicState> {
//   final UserRepo userRepo;

//   EconomicBloc({required this.userRepo})
//       : super(EconomicState(errorMessage: '')) {
//     on<GetEconomicInfo>(_mapGetUserProfileEventToState);
//   }

//   void _mapGetUserProfileEventToState(
//       event, Emitter<EconomicState> emit) async {
//     emit(state.copyWith(status: EconomicStatus.loading, errorMessage: ''));
//     try {
//       Response response = await userRepo.getUserProfile();
//       // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
//       Economic economicInfo =
//           Economic.fromJson(jsonDecode(response.body)['user']);
//       emit(state.copyWith(
//           status: EconomicStatus.success,
//           economicInfo: economicInfo,
//           errorMessage: ''));
//       // playerBloc?.emit(recommendMezmurs);
//     } catch (e) {
//       emit(state.copyWith(
//           status: EconomicStatus.error, errorMessage: e.toString()));
//     }
//   }
// }

// class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {
//   final UserRepo userRepo;

//   PersonalBloc({required this.userRepo})
//       : super(PersonalState(errorMessage: '')) {
//     on<GetEconomicInfo>(_mapGetUserProfileEventToState);
//   }

//   void _mapGetUserProfileEventToState(
//       event, Emitter<PersonalState> emit) async {
//     emit(state.copyWith(status: PersonalStatus.loading, errorMessage: ''));
//     try {
//       Response response = await userRepo.getUserProfile();
//       // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
//       Person person = Person.fromJson(jsonDecode(response.body)['user']);
//       emit(state.copyWith(
//           status: PersonalStatus.success, person: person, errorMessage: ''));
//       // playerBloc?.emit(recommendMezmurs);
//     } catch (e) {
//       emit(state.copyWith(
//           status: PersonalStatus.error, errorMessage: e.toString()));
//     }
//   }
// }
