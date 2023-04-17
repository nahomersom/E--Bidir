
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/app_constants.dart';
import '../model/login_model.dart';
import '../services/local_storage_service.dart';

class ApiRepository {
  String appBaseUrl = AppConstants.baseUrl ;
  String token = '';

  final AuthService _storageService = AuthService();
  // static const  storage =  FlutterSecureStorage();
  Future<LoginModel> authenticate(Map user) async {
try{
  final response = await http.post(
      Uri.parse(AppConstants.baseUrl + AppConstants.loginUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(user)
  ).timeout(Duration(seconds: 10));
  return LoginModel.fromJson(jsonDecode(response.body));
}on TimeoutException catch (e) {
  throw 'error';
} on SocketException catch (e) {
  throw 'error';
} on Error catch (e) {
  throw 'error';
}



  }


// Future<bool> registerUser(Map user) async {
//   var body = jsonEncode(user);
//   var response = await http.post(
//       Uri.parse(AppConstants.baseUrl + AppConstants.registerUser),
//       headers: {
//         "Content-Type": "application/json",
//       },
//       body: body
//   );
//   return true;
//   // if(response.statusCode == 200){
//   //   var authResponse = await checkPhoneNumber({"phoneNumber":user['phoneNumber']});
//   //
//   //   if(authResponse.containsKey('errors')){
//   //     return false;
//   //   }else{
//   //     // await storage.write(key: 'token', value: authResponse['jwtToken']);
//   //
//   //     await _storageService.writeToken({'token':authResponse['jwtToken']});
//   //     return true;
//   //   }
//   //
//   // }else if(response.statusCode != 200){
//   //   return false;
//   // }else{
//   //   return false;
//   // }
// }
//

}


  // Future<bool> registerUser(Map user) async {
  //   var body = jsonEncode(user);
  //   var response = await http.post(
  //       Uri.parse(AppConstants.baseUrl + AppConstants.registerUser),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: body
  //   );
  //   return true;
  //   // if(response.statusCode == 200){
  //   //   var authResponse = await checkPhoneNumber({"phoneNumber":user['phoneNumber']});
  //   //
  //   //   if(authResponse.containsKey('errors')){
  //   //     return false;
  //   //   }else{
  //   //     // await storage.write(key: 'token', value: authResponse['jwtToken']);
  //   //
  //   //     await _storageService.writeToken({'token':authResponse['jwtToken']});
  //   //     return true;
  //   //   }
  //   //
  //   // }else if(response.statusCode != 200){
  //   //   return false;
  //   // }else{
  //   //   return false;
  //   // }
  // }
  //

