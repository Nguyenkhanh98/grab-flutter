import 'package:fl_query/fl_query.dart';
import 'package:flutter_application_1/APIs/driver.api.dart';
import 'package:flutter_application_1/domain/entities/driver.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';

MutationJob<dynamic, dynamic, dynamic, dynamic, dynamic> loginMutationJob(
        LoginInput loginInput) =>
    MutationJob<Driver?, dynamic, LoginInput, void, DriverApi>(
      mutationKey: "driver/login",
      task: (variables, api) => api.login(variables),
    );
