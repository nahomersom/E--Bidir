import 'package:bloc/bloc.dart';
import 'package:e_bidir/data/model/economic.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../data/model/loan.dart';
import '../../repositories/user_repo.dart';

part 'economic_event.dart';
part 'economic_state.dart';

class EconomicBloc extends Bloc<EconomicEvent, UpdateEconomyState> {
  final UserRepo userProfileRepo;

  EconomicBloc({required this.userProfileRepo})
      : super(UpdateEconomyState(errorMessage: '')) {
    on<OnUpdateEconomy>(_mapLoanRequestToState);
  }

  void _mapLoanRequestToState(event, Emitter<UpdateEconomyState> emit) async {
    emit(state.copyWith(
        updateEconomicInfoStatus: UpdateEconomyStatus.initial,
        errorMessage: ''));
    try {
      emit(state.copyWith(
          updateEconomicInfoStatus: UpdateEconomyStatus.loading,
          errorMessage: ''));

      Response? economicResponse =
          await userProfileRepo.updateEconomicInfo(event.economic);

      emit(state.copyWith(
          updateEconomicInfoStatus: UpdateEconomyStatus.success,
          errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          updateEconomicInfoStatus: UpdateEconomyStatus.error,
          errorMessage: e.toString()));
    }
  }
}
