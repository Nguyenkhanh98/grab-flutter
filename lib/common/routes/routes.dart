import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/signin/Home/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/signin/auth.dart';
import 'package:hive/hive.dart';

Widget initalFunction() {
  return Hive.box("settings").get("userId") != null
      ? const HomeScreen()
      : const AuthScreen();
}

final Map<String, Widget Function(BuildContext context)> namedRoutes = {
  "/": (BuildContext context) => initalFunction(),
  "/login": (BuildContext context) => const AuthScreen(),
  "/booking": (BuildContext context) => const HomeScreen()
};
