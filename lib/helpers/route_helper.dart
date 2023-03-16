import 'package:flutter/material.dart';

import '../views/screens/login.dart';
class RouteHelper{
  static const String login = '/login';

  static Route getRoute(RouteSettings settings){
    switch(settings.name){
      case login:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());


      default:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
    }
  }
}