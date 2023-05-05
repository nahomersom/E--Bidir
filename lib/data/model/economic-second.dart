import 'dart:io';

import 'package:equatable/equatable.dart';

class EconomicSecond extends Equatable {
  final int Number_of_Employees;
  final int year;
  final double Total_Monthly_Income;
  final int Number_Of_Loans;
  final int Buildings;
  final int Vehicles;
  final int Lands;
  final int Companies;
  final double fully_repaid_loans;
  final double EBIT;
  final double FCBT;
  const EconomicSecond(
      {required this.Vehicles,
      required this.Lands,
      required this.Companies,
      required this.fully_repaid_loans,
      required this.Number_of_Employees,
      required this.year,
      required this.Total_Monthly_Income,
      required this.Number_Of_Loans,
      required this.EBIT,
      required this.FCBT,
      required this.Buildings});
  @override
  List<Object?> get props => [
        Number_of_Employees,
        year,
        Total_Monthly_Income,
        Number_Of_Loans,
        Buildings,
        Vehicles,
        Lands,
        EBIT,
        FCBT,
        Companies,
        fully_repaid_loans
      ];
}
