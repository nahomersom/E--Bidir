import 'package:e_bidir/views/screens/availiable_banks.dart';
import 'package:e_bidir/views/screens/home_page.dart';
import 'package:e_bidir/views/screens/introduction_screen.dart';
import 'package:e_bidir/views/screens/loan_landing.dart';
import 'package:e_bidir/views/screens/loan_request.dart';
import 'package:e_bidir/views/screens/myloans.dart';
import 'package:e_bidir/views/screens/on_boarding.dart';
import 'package:e_bidir/views/screens/shared_grid.dart';
import 'package:flutter/material.dart';

import '../views/screens/dashboard.dart';
import '../views/screens/home_layout.dart';
import '../views/screens/loan_success.dart';
import '../views/screens/login.dart';
import '../views/screens/myCollaterals.dart';
class RouteHelper{
  static const String login = '/login';
  static const String onBoard = '/onBoard';
  static const String home = '/home';
  static const String grid = '/grid';
  static const String loanLanding = "/loanLanding";
  static const String introduction = '/introduction';
  static const String myLoans = '/myLoans';
  static const String myCollaterals = '/myCollaterals';
  static const String availableBanks = '/availableBanks';
  static const String dashboard = '/dashboard';
  static const String loanSuccess  = '/loanSuccess';
  static const String loanRequest = '/loanRequest';
  static Route getRoute(RouteSettings settings){
    switch(settings.name){

      case login:
        return MaterialPageRoute(builder: (context)=>const LoginScreen());
      case introduction:
        return MaterialPageRoute(builder: (context)=>const IntroSCreen());
      case dashboard:
        return MaterialPageRoute(builder: (context)=> Dashboard());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomePage() );
      case grid:
        return MaterialPageRoute(builder: (context)=> SharedDataGrid(settings.arguments));
      case myLoans:
        return MaterialPageRoute(builder: (context)=> MyLoansDataGrid());
      case myCollaterals:
        return MaterialPageRoute(builder: (context)=> CollateralsDataGrid());
      case availableBanks:
        return MaterialPageRoute(builder: (context)=> AvailableBanksDataGrid());
      case loanLanding:
        return MaterialPageRoute(builder: (context)=> LoanLanding());
      case loanRequest:
        return MaterialPageRoute(builder: (context)=> LoanRequest());
      case onBoard:
        return MaterialPageRoute(builder: (context)=> OnBoardingScreen());
      case loanSuccess:
        return MaterialPageRoute(builder: (context)=> LoanSuccessScreen());
      default:
        return MaterialPageRoute(builder: (context)=> const LoginScreen());
    }
  }
}