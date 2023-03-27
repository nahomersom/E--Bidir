import 'package:e_bidir/views/screens/availiable_banks.dart';
import 'package:e_bidir/views/screens/my_collaterals.dart';
import 'package:e_bidir/views/screens/myloans.dart';
import 'package:e_bidir/views/screens/shared_grid.dart';
import 'package:flutter/material.dart';

import '../views/screens/home.dart';
import '../views/screens/login.dart';
class RouteHelper{
  static const String login = '/login';
  static const String home = '/home';
  static const String grid = '/grid';
  static const String myLoans = '/myLoans';
  static const String myCollaterals = '/myCollaterals';
  static const String availableBanks = '/availableBanks';
  static Route getRoute(RouteSettings settings){
    switch(settings.name){

      case login:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen() );
      case grid:
        return MaterialPageRoute(builder: (context)=> SharedDataGrid(settings.arguments));
      case myLoans:
        return MaterialPageRoute(builder: (context)=> MyLoansDataGrid());
      case myCollaterals:
        return MaterialPageRoute(builder: (context)=> MyCollateralsDataGrid());
      case availableBanks:
        return MaterialPageRoute(builder: (context)=> AvailableBanksDataGrid());

      default:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
    }
  }
}