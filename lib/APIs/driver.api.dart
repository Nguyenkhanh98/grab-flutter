import 'package:flutter_application_1/APIs/instance.api.dart';
import 'package:flutter_application_1/domain/entities/driver.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class DriverApi {
  final GrabAPIInstance instance;
  const DriverApi(this.instance);

  Future<Driver> login(LoginInput loginInput) async {
    print('===');
    print(loginInput.toJson());
    final response = await instance.post('driver/login',
        body: loginInput.toJson(), isAuth: false);

    final Driver user = response.body as Driver;
    return user;
  }

  Future<Driver> register(
      {required String phone,
      required String countryCode,
      required String name}) async {
    final response = await instance.post('/driver/register',
        body: {'phone': phone, 'countryCode': countryCode, 'name': name},
        isAuth: false);

    final Driver user = response.body as Driver;
    return user;
  }
}
