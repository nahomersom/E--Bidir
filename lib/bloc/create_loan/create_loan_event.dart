part of 'create_loan_bloc.dart';

abstract class CreateLoanEvent extends Equatable {
  const CreateLoanEvent();

  @override
  List<Object> get props => [];
}

class OnCreateLoan extends CreateLoanEvent {
  final Loan loan;
  OnCreateLoan(this.loan);
  @override
  List<Object> get props => [];
}
