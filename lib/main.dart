import 'package:e_bidir/bloc/login/login_bloc.dart';
import 'package:e_bidir/data/services/local_storage_service.dart';
import 'package:e_bidir/repositories/bank_repo.dart';
import 'package:e_bidir/repositories/user_repo.dart';
import 'package:e_bidir/themes/light_theme.dart';
import 'package:e_bidir/utils/app_constants.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:e_bidir/views/screens/custom_splash.dart';
import 'package:e_bidir/views/screens/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/collateral_post/collateral_post_bloc.dart';
import 'bloc/create_loan/create_loan_bloc.dart';
import 'bloc/economic/economic_bloc.dart';
import 'bloc/my_loan/my_loan_bloc.dart';
import 'bloc/person/personal_bloc.dart';
import 'bloc/user_profile/user_profile_bloc.dart';
import 'data/api/api_client.dart';
import 'helpers/preload_image.dart';
import 'helpers/route_helper.dart';

bool hasToken = false;
int initScreen = 0;
bool isTokenExpired = false;
void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  // await loadImage(AssetImage('assets/images/intro_1.jpg'));
  // await loadImage(AssetImage('assets/images/intro_2.jpeg'));
  // await loadImage(AssetImage('assets/images/intro_3.jpeg'));
  // await loadImage(AssetImage('assets/images/intro_4.jpeg'));
  // bool token = await AuthService().hasToken(AppConstants.token);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = await prefs.getInt("initScreen") ?? 0;
  // await prefs.setInt("initScreen", 1);
  // token ? hasToken = true : hasToken = false;
  // isTokenExpired = await AuthService().isTokenExpired();
  print(isTokenExpired);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepo(apiClient: ApiClient()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationCubit>(
              create: (BuildContext context) =>
                  AuthenticationCubit(storageService: AuthService())
                    ..onGetCurrentUser()),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(
                AuthenticationCubit(storageService: AuthService()),
                authRepo: context.read<UserRepo>()),
          ),
          BlocProvider<PersonBloc>(
              create: (BuildContext context) =>
                  PersonBloc(userProfileRepo: context.read<UserRepo>())),
          BlocProvider<CollateralBloc>(create: (BuildContext context)=>CollateralBloc(collateralRepo: context.read<UserRepo>())),

          BlocProvider<MyLoanBloc>(create: (BuildContext context)=>MyLoanBloc(myLoanRepo: context.read<BankRepo>())..add(GetMyLoans())),
          BlocProvider<CreateLoanBloc>(
              create: (BuildContext context) =>
                  CreateLoanBloc(userProfileRepo: context.read<UserRepo>())),
          BlocProvider<EconomicBloc>(
              create: (BuildContext context) =>
                  EconomicBloc(userProfileRepo: context.read<UserRepo>())),
          BlocProvider<UserProfileBloc>(
              create: (context) =>
              UserProfileBloc(userProfileRepo: context.read<UserRepo>())
                ..add(GetUserProfile())),

        ],
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'E-bidir',
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              // initialRoute: RouteHelper.onBoard,
              // initialRoute:
              // (  hasToken && !isTokenExpired) ?   RouteHelper.home : initScreen == 0  ? RouteHelper.onBoard : RouteHelper.login,
              onGenerateRoute: RouteHelper.getRoute,
              home: CustomSplash(),
            );
          },
        ),
        // child: MaterialApp(
        //
        //   title: 'E-bidir',
        //   theme:lightTheme,
        //   debugShowCheckedModeBanner: false,
        //   initialRoute:state != null ?  RouteHelper.home : : RouteHelper.login ,
        //   onGenerateRoute: RouteHelper.getRoute,
        // ),
      ),
    );
  }
}
