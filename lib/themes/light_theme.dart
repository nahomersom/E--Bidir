import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorResources.scaffoldColor,
  textTheme:  const TextTheme(
    headlineLarge: TextStyle(
      fontFamily:'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,


    ),
    headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        color: ColorResources.lightTextColor,

      fontWeight: FontWeight.w500
    ),
    labelLarge: TextStyle(
        fontFamily: 'Poppins',
        color: ColorResources.secondaryColor,
        fontWeight: FontWeight.w500,
      fontSize: 15
    ),
    titleLarge: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 20
    ),
  ),
);