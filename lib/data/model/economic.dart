import 'dart:io';

import 'package:equatable/equatable.dart';

class Economic{
  final int id;
  final String field_of_employment;
  final int Source_of_income;
  final double Experience;
  final int Number_Of_Loans;
  final double DTI;
  final int Total_Monthly_Income;
  final double fully_repaid_loans;
  const Economic(
      {required this.fully_repaid_loans,
        required this.id,
        required this.DTI,
        required this.field_of_employment,
      required this.Source_of_income,
      required this.Experience,
      required this.Number_Of_Loans,
      required this.Total_Monthly_Income});
factory Economic.fromJson(Map<String,dynamic> json){
  return Economic(
      fully_repaid_loans: json['fully_repaid_loans'],
      id: json['id'],
      DTI: json['DTI'],
      field_of_employment: json['field_of_employment'],
      Source_of_income: json['Source_of_income'],
      Experience: json['Experience'],
      Number_Of_Loans: json['Number_Of_Loans'],
      Total_Monthly_Income: json['Total_Monthly_Income']);
  }
}
