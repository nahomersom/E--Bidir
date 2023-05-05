import 'dart:io';

import 'package:equatable/equatable.dart';

class Loan extends Equatable {
  final double loan_amount;
  final String Reason_for_loan;
  final String Loan_Payment_Period;
  final String Job_Status;
  final String Bank;
  final String Type_Of_Loan;
  final String Types_of_Collateral;
  final int Monthly_payment;
  final double interest;

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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loan_amount'] = this.loan_amount;
    data['Reason_for_loan'] = this.Reason_for_loan;
    data['Loan_Payment_Period'] = this.Loan_Payment_Period;
    data['Job_Status'] = this.Job_Status;
    data['Bank'] = this.Bank;
    data['Type_Of_Loan'] = this.Type_Of_Loan;
    data['Types_of_Collateral'] = this.Types_of_Collateral;
    data['Monthly_payment'] = this.Monthly_payment;
    data['interest'] = this.interest;
    return data;
  }
}
