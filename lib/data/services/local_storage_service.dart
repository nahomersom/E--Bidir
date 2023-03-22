import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService{

  final _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      )
  );

  Future<void> writeToken(Map token) async{
    var key = token.keys.elementAt(0);
    await _storage.write(key: key, value: token['token']);

  }

  Future<String?> readToken(String token) async{
    String tokenData =  await _storage.read(key: token) ?? '';
    return tokenData;
  }

  Future<bool> hasToken(String key) async{
    bool containsKey = await _storage.containsKey(key: key);
    return containsKey;
  }


}

