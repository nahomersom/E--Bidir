import 'dart:io';

import 'package:equatable/equatable.dart';

class Economic extends Equatable {
  final String field_of_employment;
  final int Source_of_income;
  final double Experience;
  final int Number_Of_Loans;
  final int Total_Monthly_Income;
  final double fully_repaid_loans;
  const Economic(
      {required this.fully_repaid_loans,
      required this.field_of_employment,
      required this.Source_of_income,
      required this.Experience,
      required this.Number_Of_Loans,
      required this.Total_Monthly_Income});
  @override
  List<Object?> get props => [
        field_of_employment,
        Source_of_income,
        Experience,
        Number_Of_Loans,
        Total_Monthly_Income,
        fully_repaid_loans
      ];
}
