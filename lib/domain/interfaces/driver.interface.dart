import 'package:flutter_application_1/domain/entities/driver.dart';

abstract class DriverInterface {
  Future<List<Driver>> fetchDrivers();
  Future<Driver> getDrivers(String id);
}
