import 'dart:io';

class Person {
  final dynamic age;
  final dynamic Education_Status;
  final dynamic Marriage_Status;
  final dynamic Number_of_Dependents;
  final dynamic Criminal_Record;
  final dynamic PersonalScore;

  const Person(
      {
        required this.age,
        required this.Education_Status,
        required this.Marriage_Status,
        required this.Number_of_Dependents,
        required this.Criminal_Record,
        required this.PersonalScore,
      });
  factory Person.fromJson(Map<String,dynamic> json){
    return Person(
        age: json['age'],
        Education_Status: json['Education_Status'],
        Marriage_Status: json['Marriage_Status'],
        Number_of_Dependents: json['Number_Of_Dependents'],
        Criminal_Record: json['Criminal_Record'],
        PersonalScore: json['PersonalScore']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['Education_Status'] = this.Education_Status;
    data['Marriage_Status'] = this.Marriage_Status;
    data['Number_of_Dependents'] = this.age;
    data['Criminal_Record'] = this.Education_Status;
    data['PersonalScore'] = this.Marriage_Status;
    return data;
  }
}