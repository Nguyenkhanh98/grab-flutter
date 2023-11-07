import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/Screens/Auth/SignInScreen.dart';
import 'package:flutter_application_1/presentation/Screens/Home/HomeScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

Widget initalFunction() {
  return Hive.box("settings").get("userId") != null
      ? const HomeScreen()
      : SignInScreen();
}

// final Map<String, Widget Function(BuildContext context)> namedRoutes = {
//   "/": (BuildContext context) => initalFunction(),
//   "/login": (BuildContext context) => const AuthScreen(),
//   "/booking": (BuildContext context) => const HomeScreen()
// };

final List<GoRoute> goRoutes = [
  GoRoute(
    path: "/",
    builder: (BuildContext context, state) => initalFunction(),
  ),
  GoRoute(
    path: "/login",
    builder: (BuildContext context, state) => SignInScreen(),
  ),
  GoRoute(
    path: "/booking",
    builder: (BuildContext context, state) => const HomeScreen(),
  )
];
