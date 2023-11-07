import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/Screens/Home/HomeScreen.dart';
import 'package:flutter_application_1/presentation/screens/Auth/SignInScreen.dart';
import 'package:logging/logging.dart';

class HandleRoute {
  static Route? handleRoute(String? url) {
    Logger.root.info('received route url: $url');
    switch (url) {
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/booking':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
