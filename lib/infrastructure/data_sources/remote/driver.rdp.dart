import 'package:flutter_application_1/APIs/driver.api.dart';
import 'package:flutter_application_1/domain/entities/driver.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DriverRemoteDataProvider {
  final DriverApi driverApi;
  DriverRemoteDataProvider(this.driverApi);

  Future<Driver> getProfile() {
    return Future.value(null);
  }

  Future<Driver?> login(LoginInput loginInput) async {
    return await driverApi.login(loginInput);
  }

  Future<Driver> register(
      {required String phone,
      required String countryCode,
      required String name}) async {
    return await driverApi.register(
        phone: phone, countryCode: countryCode, name: name);
  }
}
