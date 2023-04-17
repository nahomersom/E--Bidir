// import 'package:e_bidir/data/model/login_model.dart';
// import 'package:e_bidir/data/services/local_storage_service.dart';
// import 'package:http/http.dart';
//
// import '../repositories/auth_repo.dart';
//
// class AuthController{
//   AuthRepo? authRepo;
//   AuthService? authService;
//   Future<LoginModel> login({required String phoneNo, required String password}) async {
//
//     Response? response = await authRepo?.login(phoneNo: phoneNo, password: password);
//     LoginModel loginResponse =  LoginModel.fromJson(response as Map<String, dynamic>);
//     print('hi');
//     print(response?.body);
//
//     if (loginResponse.status && loginResponse.token != null) {
//       authService?.writeToken(loginResponse);
//
//     }
//
//     return loginResponse;
//   }
// }