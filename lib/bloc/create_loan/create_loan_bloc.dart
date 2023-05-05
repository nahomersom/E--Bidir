import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../data/model/loan.dart';
import '../../repositories/user_repo.dart';

part 'create_loan_event.dart';
part 'create_loan_state.dart';

class CreateLoanBloc extends Bloc<CreateLoanEvent, CreateLoanState> {
  final UserRepo userProfileRepo;

  CreateLoanBloc({required this.userProfileRepo})
      : super(CreateLoanState(errorMessage: '')) {
    on<OnCreateLoan>(_mapLoanRequestToState);
  }

  void _mapLoanRequestToState(event, Emitter<CreateLoanState> emit) async {
    emit(state.copyWith(
        newLoanInfoStatus: LoanRequestStatus.initial, errorMessage: ''));
    try {
      emit(state.copyWith(
          newLoanInfoStatus: LoanRequestStatus.loading, errorMessage: ''));

      Response? userProfileResponse =
          await userProfileRepo.loanRequest(event.loan);

      emit(state.copyWith(
          newLoanInfoStatus: LoanRequestStatus.success, errorMessage: ''));
      // playerBloc?.emit(recommendMezmurs);
    } catch (e) {
      emit(state.copyWith(
          newLoanInfoStatus: LoanRequestStatus.error,
          errorMessage: e.toString()));
    }
  }
}
