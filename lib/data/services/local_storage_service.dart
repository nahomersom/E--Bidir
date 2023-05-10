import 'package:e_bidir/data/api/api_client.dart';
import 'package:e_bidir/data/model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../repositories/user_repo.dart';

class AuthService{
  UserRepo authRepo = UserRepo(apiClient: ApiClient());
  final _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      )
  );

  Future<void> writeToken(LoginModel user) async{
    // var key = token.keys.elementAt(0);
    print('tokent');
    print(user.token);
    await _storage.write(key: 'token', value: user.token);

  }

  Future<String?> readToken(String token) async{
    String tokenData =  await _storage.read(key: token) ?? '';
    return tokenData;
  }

  Future<bool> hasToken(String key) async{
    bool containsKey = await _storage.containsKey(key: key);
    return containsKey;
  }
  Future<void> removeToken() async{
    await _storage.deleteAll();
  }
 Future<bool> isTokenExpired() async {
     try{
       var response = await authRepo.getUserProfile();
       return false;
     }catch(e){
      var error = e.toString().replaceAll('Exception:', '');
      if(error == 'Please Login to Access'){
        return true;
      }
     }
     return false;
 }
}

