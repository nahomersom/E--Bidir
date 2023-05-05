part of 'create_loan_bloc.dart';

enum LoanRequestStatus { initial, loading, success, error }

extension LoanRequestStatusx on LoanRequestStatus {
  bool get isLoanRequestInitial => this == LoanRequestStatus.initial;
  bool get isLoanRequestLoading => this == LoanRequestStatus.loading;
  bool get isLoanRequestSuccess => this == LoanRequestStatus.success;
  bool get hasLoanRequestError => this == LoanRequestStatus.error;
}

class CreateLoanState extends Equatable {
  CreateLoanState({
    this.newLoanInfoStatus = LoanRequestStatus.initial,
    Loan? newLoanInfo,
    required this.errorMessage,
  }) : loan = newLoanInfo;

  final LoanRequestStatus newLoanInfoStatus;
  final Loan? loan;
  final String errorMessage;

  @override
  List<Object?> get props => [
        newLoanInfoStatus,
        errorMessage,
        loan,
      ];

  CreateLoanState copyWith(
      {LoanRequestStatus? newLoanInfoStatus, Loan? loan, errorMessage}) {
    return CreateLoanState(
        newLoanInfoStatus: newLoanInfoStatus ?? this.newLoanInfoStatus,
        newLoanInfo: loan ?? this.loan,
        errorMessage: errorMessage);
  }
}
