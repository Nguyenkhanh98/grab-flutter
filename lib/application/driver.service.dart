import 'package:flutter_application_1/domain/entities/driver.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_application_1/infrastructure/repositories/driver.repository.dart';
import 'package:flutter_application_1/infrastructure/repositories/user.repository.dart';

class DriverService {
  final DriverRepository driverRpository;
  DriverService(this.driverRpository);

  Future<Driver?> login(LoginInput loginInput) async {
    return await driverRpository.login(loginInput);
  }
}
