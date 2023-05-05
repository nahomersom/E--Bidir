import 'dart:io';

import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final dynamic Type_of_Vehicle;
  final dynamic Brand_of_Vehicle;
  final dynamic Model_of_Vehicle;
  final dynamic Year_of_Manufacture;
  final dynamic Country_of_Manufacture;
  final dynamic Number_of_Cylinders;
  final dynamic Plate_Number;
  final dynamic Horsepower;
  final dynamic Transportation_Capacity;
  final dynamic carScore;
  final dynamic Mileage;
  final dynamic LoanId;
  final dynamic carImage;
  final dynamic Collateral_Coverage_Ratio;
  const Car(
      {required this.Number_of_Cylinders,
      required this.Type_of_Vehicle,
      required this.Brand_of_Vehicle,
      required this.Model_of_Vehicle,
      required this.Year_of_Manufacture,
      required this.Country_of_Manufacture,
      required this.Horsepower,
      required this.carScore,
      required this.carImage,
      required this.Mileage,
      required this.LoanId,
      required this.Plate_Number,
      required this.Collateral_Coverage_Ratio,
      required this.Transportation_Capacity});
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        Type_of_Vehicle: json['Type_of_Vehicle'],
        LoanId: json['LoanId'],
        Brand_of_Vehicle: json['Brand_of_Vehicle'],
        Model_of_Vehicle: json['Model_of_Vehicle'],
        Year_of_Manufacture: json['Year_of_Manufacture'],
        Country_of_Manufacture: json['Country_of_Manufacture'],
        Number_of_Cylinders: json['Number_of_Cylinders'],
        Mileage: json['Mileage'],
        Plate_Number: json['Plate_Number'],
        carImage: json['carImage'],
        carScore: json['carScore'],
        Horsepower: json['Horsepower'],
        Transportation_Capacity: json['Transportation_Capacity'],
        Collateral_Coverage_Ratio: json['Collateral_Coverage_Ratio']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
