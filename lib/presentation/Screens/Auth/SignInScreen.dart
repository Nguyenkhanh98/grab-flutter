import 'dart:html';

import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/APIs/driver.api.dart';
import 'package:flutter_application_1/common/operation/mutations/user.mutation.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

class SignInScreen extends HookWidget {
  final String phone;

  const SignInScreen({this.phone = ''});

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    final mutation = useMutationJob(
      job: loginMutationJob(new LoginInput(phone: '', countryCode: '')),
      args: DriverApi,
      onError: (error, recoveryData) => print(error),
      onData: (data, recoveryData) => print(data),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Center(
        child: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
