import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../../utils/app_constants.dart';
import 'package:http/http.dart' as Http;

import '../model/response/error_response.dart';
import '../services/local_storage_service.dart';
class ApiClient{
  String appBaseUrl = AppConstants.baseUrl ;
  final String noInternetMessage = 'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String>? _mainHeaders;
  //
  // ApiClient()
  // {
  //   readToken();
  //   print(" token.............................................$token");
  //
  //   _mainHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': '$token'
  //   };
  // }
Future readToken() async{
   AuthService storageService = AuthService();
  token =   await storageService.readToken(AppConstants.token);
  _mainHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Token': '$token',
    //AppConstants.ZONE_ID: zoneID
  };
}
  void updateHeader(String token, String zoneID) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Token': '$token',
      //AppConstants.ZONE_ID: zoneID
    };
  }


  Future<dynamic> getData(
      String uri, {Map<String, String>? headers}) async {
      await readToken();
      if (kDebugMode) {
        print('++++++++ $_mainHeaders');
        print('====> API Call: $uri\nToken: $token');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      if (_response.body.isNotEmpty) {
        var response = jsonDecode(_response.body);
        if (_response.statusCode == 200 || _response.statusCode == 201) {
          return Response(_response.body, _response.statusCode);
        } else {
          throw Exception('Error: ${response['message']}');
        }
      } else {
        throw Exception('Something Went Wrong');
      }

  }

  Future<dynamic> postData(

      String uri, dynamic body, {Map<String, String>? headers}) async {


        print('====> GetX Base URL: $appBaseUrl');
        print('====> GetX Call: $uri');
        print('====> GetX Body: $body');

      Http.Response _response = await Http.post(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));


          if (_response.body.isNotEmpty) {
            var response = jsonDecode(_response.body);
            if (_response.statusCode == 200 || _response.statusCode == 201) {
            return Response(_response.body, _response.statusCode);
          } else {
              throw Exception('Error: ${response['message']}');
          }
        } else {
          throw Exception('Something Went Wrong');
        }


  }


  Future<Response> putData(
      String uri,
      dynamic body, {
        required Map<String, dynamic> query,
        required String contentType,
        required Map<String, String> headers,
        required Function(dynamic) decoder,
        required Function(double) uploadProgress
      }) async {
    try {
      print('====> GetX Call: $uri');
      print('====> GetX Body: $body');
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if(kDebugMode) {
        print('====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }

      return response;

    } catch (e) {
      return Response(noInternetMessage,1,reasonPhrase: noInternetMessage);
    }
  }

  Response handleResponse(Http.Response response) {

    dynamic _body;
    try {
      _body = jsonDecode(response.body);

    }catch(e) {

    }

    Response _response = Response(
        _body,
        response.statusCode
    );
    print('itskjsk');
    if(_response.statusCode != 200 || _response.body.isEmpty || _response.statusCode != 201){

        _response = Response( _response.body,_response.statusCode);

    }
    return _response;
  }
}
