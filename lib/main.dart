import 'package:e_bidir/bloc/login/login_bloc.dart';
import 'package:e_bidir/data/services/local_storage_service.dart';
import 'package:e_bidir/repositories/auth_repo.dart';
import 'package:e_bidir/themes/light_theme.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'data/api/api_client.dart';
import 'helpers/route_helper.dart';

void main() {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return

      RepositoryProvider(

      create: (context)=> AuthRepo(apiClient: ApiClient()),

      child: MultiBlocProvider(
        providers:
        [
          BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(storageService: AuthService())..onGetCurrentUser()

          ),

          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(AuthenticationCubit(storageService: AuthService()),authRepo: context.read<AuthRepo>()),

          ),

        ],
      child:BlocBuilder<AuthenticationCubit,AuthenticationState>(
      builder: (context,state){
      return MaterialApp(

      title: 'E-bidir',
      theme:lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute:state.status.authenticated ? RouteHelper.login : RouteHelper.home ,
      onGenerateRoute: RouteHelper.getRoute,
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

