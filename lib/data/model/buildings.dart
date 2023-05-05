import 'dart:io';

import 'package:equatable/equatable.dart';

// {
//           "Construction_Status": {
//               "Sub_Structure": 1,
//               "Super_Structure": 1,
//               "Partially": 1,
//               "Fully": 1,
//               "Electro_Mechanical_Lifts": 1
//           },
//           "utility": {
//               "water": 1,
//               "internet": 1,
//               "gas": 1,
//               "electricity": 1
//           },
//           "_id": "63fa3a747dd34a0442f57a06",
//           "Location": "Wossen",
//           "Year_of_Construction": 2019,
//           "Total_Area": 200,
//           "Distance_from_Main_Road": 10,
//           "Type_of_Building": "G+2",
//           "Purpose_of_the_Building": "Residential",
//           "Collateral_Coverage_Ratio": 2.877442761535752,
//           "Building_Score": 230,
//           "blueprintId": 258621,
//           "blueprint": [
//               {
//                   "public_id": "blueprint/osydrhspgnhahbloh6lt",
//                   "url": "https://res.cloudinary.com/da8hdfiix/image/upload/v1677343347/blueprint/osydrhspgnhahbloh6lt.png",
//                   "_id": "63fa3a747dd34a0442f57a07"
//               }
//           ],
//           "LoanId": "63fa39f87dd34a0442f579f9",
//           "id": "63fa1d767dd34a0442f575b7",
//           "createdAt": "2023-02-25T16:42:28.784Z",
//           "__v": 0
//       },
class Building extends Equatable {
  final dynamic Construction_Status;
  final dynamic utility;
  final dynamic Location;
  final dynamic Year_of_Manufacture;

  final dynamic Total_Area;
  final dynamic Distance_from_Main_Road;

  final dynamic Type_of_Building;
  final dynamic Purpose_of_the_Building;

  final dynamic Collateral_Coverage_Ratio;
  final dynamic Building_Score;

  final dynamic blueprintId;
  final dynamic blueprint;

  final dynamic LoanId;
  final dynamic createdAt;
  const Building({
    required this.Construction_Status,
    required this.utility,
    required this.Location,
    required this.Year_of_Manufacture,
    required this.Total_Area,
    required this.Distance_from_Main_Road,
    required this.Type_of_Building,
    required this.Purpose_of_the_Building,
    required this.Collateral_Coverage_Ratio,
    required this.LoanId,
    required this.Building_Score,
    required this.blueprintId,
    required this.blueprint,
    required this.createdAt,
  });
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
        Construction_Status: json['Construction_Status'],
        LoanId: json['LoanId'],
        utility: json['utility'],
        Location: json['Location'],
        Year_of_Manufacture: json['Year_of_Manufacture'],
        Total_Area: json['Total_Area'],
        Distance_from_Main_Road: json['Distance_from_Main_Road'],
        Type_of_Building: json['Type_of_Building'],
        Purpose_of_the_Building: json['Purpose_of_the_Building'],
        Collateral_Coverage_Ratio: json['Collateral_Coverage_Ratio'],
        blueprintId: json['blueprintId'],
        Building_Score: json['Building_Score'],
        blueprint: json['blueprint'],
        createdAt: json['createdAt']);
  }
  @override
  List<Object?> get props => [
        Construction_Status,
        LoanId,
        utility,
        Location,
        Year_of_Manufacture,
        Total_Area,
        Distance_from_Main_Road,
        Type_of_Building,
        Purpose_of_the_Building,
        Collateral_Coverage_Ratio,
        LoanId,
        Building_Score,
        blueprintId,
        blueprint,
        createdAt,
      ];
}
