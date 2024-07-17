import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Colors.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(

    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: donBackgroundColor,
      shadowColor: Colors.black,
      elevation: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: donBackgroundColor,
      ),

    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[800], // Background color
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding inside the input field
      border: OutlineInputBorder( // Border style
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder( // Border when the input is enabled
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder( // Border when the input is focused
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.5),
      ),
      errorBorder: OutlineInputBorder( // Border when there is an error
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder( // Border when there is an error and input is focused
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      labelStyle: TextStyle(color: Colors.grey[400]), // Style for the label text
      hintStyle: TextStyle(color: Colors.grey[400]), // Style for the hint text
    ),

    colorScheme: const ColorScheme.dark(
        primary: donBackgroundColor,
        onPrimary: Colors.lightBlue,
        secondary: dContainerColor,
        onBackground: dContainerColor,
        primaryContainer: dContainerColor,
        onPrimaryContainer: dPrimaryColor,
      // secondary:
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        color: dPrimaryColor,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        color: donBackgroundColor,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        color: dBackgroundColor,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w600,
      ),

      labelLarge: TextStyle(
        fontSize: 13,
        color: dContainerColor,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w400,
      ),

      labelMedium: TextStyle(
        fontSize: 12,
        color: dContainerColor,
        fontFamily: 'AlegreyaSansSC-Bold',
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
        color: Colors.white,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: donBackgroundColor,
        fontFamily: 'AlegreyaSansSC',
        fontWeight: FontWeight.w500,
      ),



    )
);