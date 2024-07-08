import 'package:flutter/material.dart';

import 'Colors.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(

  brightness: Brightness.dark,
  useMaterial3: true,



  colorScheme: const ColorScheme.dark(
    primary: dPrimaryColor,
    onPrimary: donBackgroundColor,
    onBackground: dContainerColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: dPrimaryColor
  ),
    textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32,
      color: dPrimaryColor,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
    ),
      headlineMedium: TextStyle(
        fontSize: 30,
        color: donBackgroundColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        color: dBackgroundColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),

      labelLarge: TextStyle(
        fontSize: 15,
        color: dContainerColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),

      labelMedium: TextStyle(
        fontSize: 12,
        color: dContainerColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: dContainerColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: donBackgroundColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: donBackgroundColor,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),



)
);