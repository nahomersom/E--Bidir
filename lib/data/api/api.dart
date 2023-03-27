
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/app_constants.dart';
import '../services/local_storage_service.dart';

class ApiService {
  String appBaseUrl = AppConstants.baseUrl ;
  String token = '';

  final StorageService _storageService = StorageService();
  // static const  storage =  FlutterSecureStorage();

  Future<Map> authenticate(Map user) async {
    final response = await http.post(
        Uri.parse(AppConstants.baseUrl + AppConstants.loginUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(user)
    );
Map res = jsonDecode(response.body);
return res;
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