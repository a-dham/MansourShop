// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';

const String onBoarding = "/onBoarding";
const String login = "/login";
const String register = "/register";
const String home = "/home";

const Color kmaincolor = Color(0xff267bff);

//print all text if it is very long

void printAllText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) {
    print(match.group(0));
  });
}
