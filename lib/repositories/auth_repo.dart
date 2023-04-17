import 'dart:math';

import 'package:e_bidir/data/model/user.dart';
import 'package:e_bidir/utils/app_constants.dart';
import 'package:http/http.dart';

import '../data/api/api_client.dart';
import '../data/model/login_model.dart';
class AuthRepo{

   final ApiClient apiClient;
   AuthRepo({required this.apiClient});
  Future<Response> login(User user)  async{
     return await apiClient.postData(AppConstants.loginUrl, {"phoneNo": user.phoneNo, "password": user.password});

  }

}
