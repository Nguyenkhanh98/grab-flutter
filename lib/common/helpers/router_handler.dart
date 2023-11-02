import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/signin/Home/home_screen.dart';
import 'package:flutter_application_1/presentation/screens/signin/auth.dart';
import 'package:logging/logging.dart';

class HandleRoute {
  static Route? handleRoute(String? url) {
    Logger.root.info('received route url: $url');
    switch (url) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/booking':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
