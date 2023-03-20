import 'package:flutter/material.dart';

import '../views/screens/home.dart';
import '../views/screens/login.dart';
class RouteHelper{
  static const String login = '/login';
  static const String home = '/home';
  static Route getRoute(RouteSettings settings){
    switch(settings.name){
      case login:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen() );
      default:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
    }
  }
}