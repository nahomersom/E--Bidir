import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
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
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      color: ColorResources.accentColor,
      fontWeight: FontWeight.bold
    ),
    labelLarge: TextStyle(
        fontFamily: 'Poppins',
        color: ColorResources.secondaryColor,
        fontWeight: FontWeight.w500,
      fontSize: 15
    ),
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 13
    ),
    titleLarge: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 20
    ),
    titleSmall: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 15
    )
  ),
);