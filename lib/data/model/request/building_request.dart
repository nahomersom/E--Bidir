import 'dart:io';

import 'package:equatable/equatable.dart';

class BuildingBody {
  final dynamic Location;
  final dynamic Year_of_Construction;
  final dynamic Total_Area;
  final dynamic Distance_from_Main_Road;
  final dynamic Type_of_Building;
  final dynamic Purpose_of_the_Building;
  final dynamic Construction_Status;
  final dynamic utility;

  final dynamic type;
  final dynamic blueprintId;
  final dynamic blueprint;

  const BuildingBody(
      {required this.Purpose_of_the_Building,
      required this.Location,
      required this.Year_of_Construction,
      required this.Total_Area,
      required this.Distance_from_Main_Road,
      required this.Type_of_Building,
      required this.Construction_Status,
      required this.utility, required this.blueprintId,
      required this.blueprint,
      required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Purpose_of_the_Building'] = this.Purpose_of_the_Building;
    data['Location'] = this.Location;
    data['Year_of_Construction'] = this.Year_of_Construction;
    data['Total_Area'] = this.Total_Area;
    data['Type_of_Building'] = this.Type_of_Building;
    data['Distance_from_Main_Road'] = this.Distance_from_Main_Road;
    data['Construction_Status'] = this.Construction_Status;
    data['utility'] = this.utility;
    data['blueprintId'] = this.blueprintId;
    data['blueprint'] = this.blueprint;

    data['type'] = this.type;
    return data;
  }
}
