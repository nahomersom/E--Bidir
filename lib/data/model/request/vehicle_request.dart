import 'dart:io';

import 'package:equatable/equatable.dart';

class VehicleBody {
  final dynamic Brand_of_Vehicle;
  final dynamic Country_of_Manufacture;
  final dynamic Horsepower;
  final dynamic Mileage;
  final dynamic Model_of_Vehicle;
  final dynamic Number_of_Cylinders;
  final dynamic Plate_Number;
  final dynamic Transmission;
  final dynamic Transportation_Capacity;
  final dynamic Type_of_Vehicle;
  final dynamic Year_of_Manufacture;
  final dynamic carImage;
  final dynamic type;

  const VehicleBody(
      {required this.Number_of_Cylinders,
      required this.Brand_of_Vehicle,
      required this.Country_of_Manufacture,
      required this.Horsepower,
      required this.Mileage,
      required this.Model_of_Vehicle,
      required this.Plate_Number,
      required this.Transmission,
      required this.Transportation_Capacity,
      required this.Type_of_Vehicle,
      required this.Year_of_Manufacture,
      required this.carImage,
      required this.type});
  factory VehicleBody.fromJson(Map<String, dynamic> json) {
    return VehicleBody(
      Number_of_Cylinders: json['Number_of_Cylinders'],
      Brand_of_Vehicle: json['Brand_of_Vehicle'],
      Country_of_Manufacture: json['Country_of_Manufacture'],
      Horsepower: json['Horsepower'],
      Mileage: json['Mileage'],
      Model_of_Vehicle: json['Model_of_Vehicle'],
      Plate_Number: json['Plate_Number'],
      Transmission: json['Transmission'],
      Transportation_Capacity: json['Transportation_Capacity'],
      Type_of_Vehicle: json['Type_of_Vehicle'],
      Year_of_Manufacture: json['Year_of_Manufacture'],
      carImage: json['carImage'],
      type: json['type'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Number_of_Cylinders'] = this.Number_of_Cylinders;
    data['Brand_of_Vehicle'] = this.Brand_of_Vehicle;
    data['Country_of_Manufacture'] = this.Country_of_Manufacture;
    data['Horsepower'] = this.Horsepower;
    data['Model_of_Vehicle'] = this.Model_of_Vehicle;
    data['Mileage'] = this.Mileage;
    data['Plate_Number'] = this.Plate_Number;
    data['Transmission'] = this.Transmission;
    data['Transportation_Capacity'] = this.Transportation_Capacity;
    data['Type_of_Vehicle'] = this.Type_of_Vehicle;
    data['Year_of_Manufacture'] = this.Year_of_Manufacture;
    data['carImage'] = this.carImage;
    data['type'] = this.type;
    return data;
  }
}
