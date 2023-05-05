import 'dart:io';

import 'package:equatable/equatable.dart';

class Economic {
  final dynamic field_of_employment;
  final dynamic Source_of_income;
  final dynamic Experience;
  final dynamic Number_Of_Loans;

  final dynamic Total_Monthly_Income;
  final dynamic fully_repaid_loans;
  const Economic(
      {required this.fully_repaid_loans,
      required this.field_of_employment,
      required this.Source_of_income,
      required this.Experience,
      required this.Number_Of_Loans,
      required this.Total_Monthly_Income});
  factory Economic.fromJson(Map<String, dynamic> json) {
    return Economic(
        fully_repaid_loans: json['fully_repaid_loans'],
        field_of_employment: json['field_of_employment'],
        Source_of_income: json['Source_of_income'],
        Experience: json['Experience'],
        Number_Of_Loans: json['Number_Of_Loans'],
        Total_Monthly_Income: json['Total_Monthly_Income']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fully_repaid_loans'] = this.fully_repaid_loans;
    data['field_of_employment'] = this.field_of_employment;
    data['Source_of_income'] = this.Source_of_income;
    data['Experience'] = this.Experience;
    data['Total_Monthly_Income'] = this.Total_Monthly_Income;
    data['Number_Of_Loans'] = this.Number_Of_Loans;
    return data;
  }
}
