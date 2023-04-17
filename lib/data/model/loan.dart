import 'dart:io';

import 'package:equatable/equatable.dart';

class Loan extends Equatable {
  final int loan_amount;
  final String Reason_for_loan;
  final String Loan_Payment_Period;
  final String Job_Status;
  final String Bank;
  final String Type_Of_Loan;
  final String Types_of_Collateral;
  final int Monthly_payment;
  final int interest;

  const Loan(
      {required this.Type_Of_Loan,
      required this.Types_of_Collateral,
      required this.Monthly_payment,
      required this.interest,
      required this.loan_amount,
      required this.Reason_for_loan,
      required this.Loan_Payment_Period,
      required this.Job_Status,
      required this.Bank});
  @override
  List<Object?> get props => [
        loan_amount,
        Reason_for_loan,
        Loan_Payment_Period,
        Job_Status,
        Bank,
        Type_Of_Loan,
        Types_of_Collateral,
        Monthly_payment,
        interest
      ];
}
