import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    iconTheme: const IconThemeData(
      color: Colors.blue,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    iconTheme: const IconThemeData(
      color: Colors.blue,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
