import 'dart:io';

import 'package:equatable/equatable.dart';

class Person extends Equatable{
  final int age;
  final String Education_Status;
  final String Marriage_Status;
  final int Number_of_Dependents;
  final String Criminal_Record;

  const Person({required this.age, required this.Education_Status, required this.Marriage_Status, required this.Number_of_Dependents, required this.Criminal_Record});
  @override
  List<Object?> get props => [age,Education_Status,Marriage_Status,Number_of_Dependents,Criminal_Record];
}