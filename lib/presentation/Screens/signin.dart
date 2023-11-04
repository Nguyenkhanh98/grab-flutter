import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SignInScreen extends StatefulWidget {
  final String phone;

  const SignInScreen({this.phone = ''});

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Center(
        child: SigninForm,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
