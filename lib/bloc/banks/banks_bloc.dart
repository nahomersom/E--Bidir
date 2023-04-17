import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
part 'banks_state.dart';
part 'banks_event.dart';

class BankBloc extends Bloc<BanksEvent,BankState> {
  final BankRepo bankRepo;

  BankBloc({required this.bankRepo})
      :super(BankState(errorMessage: '')){
    on<GetBanks>(_mapGetRecommendedEventToState);


  }

  void _mapGetRecommendedEventToState(event, Emitter<BankState> emit) async{
    List<BankInfo> banks;
    emit(state.copyWith(status: BankStatus.loading,errorMessage: ''));
    try{

      Response response = await bankRepo.getBanks();
      print('*******************');
      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      banks=(json.decode(response.body)['banks'] as List).map((i) =>
          BankInfo.fromJson(i)).toList();
      banks = banks.where((i) => i.status == 'active').toList();

      emit(state.copyWith(
          status: BankStatus.success,
          bankInfo: banks,
        errorMessage: ''
      ));
      // playerBloc?.emit(recommendMezmurs);
    }catch(e){

      emit(state.copyWith(status: BankStatus.error,errorMessage: e.toString()));
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

