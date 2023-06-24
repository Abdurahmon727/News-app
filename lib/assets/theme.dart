import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: 'Outfit',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
          headlineMedium: headline4,
          headlineSmall: headline5,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Outfit',
        useMaterial3: true,
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: black,
  );
  static const headline2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: black,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: darkGrey,
  );
  static const headline5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: darkGrey,
  );
}
