import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../data/model/bank/bank_info.dart';
import '../../data/model/my_loan/my_loan_info.dart';
part 'my_loan_state.dart';
part 'my_loan_event.dart';

class MyLoanBloc extends Bloc<MyLoanEvent,MyLoanState> {
  final BankRepo myLoanRepo;

  MyLoanBloc({required this.myLoanRepo})
      :super(MyLoanState(errorMessage: '')){
    on<GetMyLoans>(_mapGetRecommendedEventToState);


  }

  void _mapGetRecommendedEventToState(event, Emitter<MyLoanState> emit) async{
    List<MyLoanInfo> myLoans;
    emit(state.copyWith(status: MyLoanStatus.loading,errorMessage: ''));
    try{

      Response response = await myLoanRepo.getLoan();
      print('*******************');
      // (json.decode(response.body)['banks'] as List).map((e) => print(e)).toList();
      print(json.decode(response.body)['myloan']);
      myLoans = (json.decode(response.body)['myloan'] as List).map((i) =>
          MyLoanInfo.fromJson(i)).toList();

      emit(state.copyWith(
          status: MyLoanStatus.success,
          myLoanInfo: myLoans,
        errorMessage: ''
      ));
      // playerBloc?.emit(recommendMezmurs);
    }catch(e){

      emit(state.copyWith(status: MyLoanStatus.error,errorMessage: e.toString()));
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

