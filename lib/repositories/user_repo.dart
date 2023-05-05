import 'dart:convert';
import 'dart:math';

import 'package:e_bidir/data/model/request/vehicle_request.dart';
import 'package:e_bidir/data/model/user.dart';
import 'package:e_bidir/utils/app_constants.dart';
import 'package:http/http.dart';

import '../data/api/api_client.dart';
import '../data/model/economic.dart';
import '../data/model/loan.dart';
import '../data/model/login_model.dart';
import '../data/model/person.dart';
import '../data/model/request/building_request.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future<Response> login(User user) async {
    return await apiClient.postData(AppConstants.loginUrl,
        {"phoneNo": user.phoneNo, "password": user.password});
  }

  Future<Response> getUserProfile() async {
    return await apiClient.getData(AppConstants.userProfile);
  }

  Future<Response> getEconomicInfo() async {
    return await apiClient.getData(AppConstants.economicInfo);
  }

  Future<Response> getPersonalInfo() async {
    return await apiClient.getData(AppConstants.personalProfile);
  }

  Future<Response> getCars() async {
    return await apiClient.getData(AppConstants.cars);
  }

  Future<Response> getBuilding() async {
    return await apiClient.getData(AppConstants.buildings);
  }

  Future<Response> loanRequest(Loan loan) async {
    return await apiClient.postData(AppConstants.addLoan, loan);
  }

  Future<Response> updateEconomicInfo(Economic economy) async {
    return await apiClient.putData(AppConstants.economicInfo, economy);
  }

  Future<Response> updatePersonalInfo(Person person) async {
    return await apiClient.putData(AppConstants.personalProfile, person);
  }

  Future<Response> addVehicle(VehicleBody vehicle) async {
    print(jsonEncode(vehicle));
    return await apiClient.postData(AppConstants.addVehicle, vehicle);
  }

  Future<Response> addBuilding(BuildingBody building) async {
    return await apiClient.postData(AppConstants.addBuilding, building);
  }
}
