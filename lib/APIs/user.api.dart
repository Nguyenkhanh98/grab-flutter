import 'package:flutter_application_1/APIs/instance.api.dart';

class UserApi {
  final GrabAPIInstance instance;

  const UserApi(this.instance);

  Future<dynamic> login(
      {required String phone, required String countrycode}) async {
    return await instance.post('/user/login',
        body: {
          'phone': phone,
          'countrycode': countrycode,
        },
        isAuth: false);
  }

  Future<dynamic> register(
      {required String phone,
      required String countrycode,
      required String name}) async {
    return await instance.post('/user/register',
        body: {'phone': phone, 'countrycode': countrycode, 'name': name},
        isAuth: false);
  }
}
