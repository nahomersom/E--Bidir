import 'dart:io';

import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String Type_of_Vehicle;
  final String Brand_of_Vehicle;
  final String Model_of_Vehicle;
  final int Year_of_Manufacture;
  final String Country_of_Manufacture;
  final double Number_of_Cylinders;
  final String Plate_Number;
  final String Horsepower;
  final String Transportation_Capacity;
  final double carScore;
  final String Mileage;

  final String LoanId;
  final File carImage;
  final String Collateral_Coverage_Ratio;
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
  @override
  List<Object?> get props => [
        Type_of_Vehicle,
        LoanId,
        Brand_of_Vehicle,
        Model_of_Vehicle,
        Year_of_Manufacture,
        Country_of_Manufacture,
        Number_of_Cylinders,
        Mileage,
        Plate_Number,
        carImage,
        carScore,
        Horsepower,
        Transportation_Capacity
      ];
}
