import 'package:e_bidir/themes/light_theme.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helpers/route_helper.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'E-bidir',
      theme:lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.login,

      onGenerateRoute: RouteHelper.getRoute,
    );
  }
}

