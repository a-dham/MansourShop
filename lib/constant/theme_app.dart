import 'package:flutter/material.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:sizer/sizer.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    secondaryHeaderColor: Colors.black,
    iconTheme: IconThemeData(
      color: kmaincolor,
      size: 20.sp,
    ),
    textTheme: TextTheme(
      // bodyLarge: textsty,
      headline6: TextStyle(
        fontSize: 15.sp,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 18.sp,
      ),
      bodyText1: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    secondaryHeaderColor: Colors.white,
    iconTheme: IconThemeData(
      color: kmaincolor,
      size: 20.sp,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 15.sp,
        color: Colors.white,
      ),
      subtitle1: const TextStyle(
        fontSize: 18,
      ),
      bodyText1: const TextStyle(
        fontSize: 5,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        fontSize: 13.sp,
        color: Colors.black,
      ),
    ),
  );
}
