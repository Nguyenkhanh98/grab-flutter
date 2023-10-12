import 'package:flutter_application_1/catalog/domain/entities/driver.dart';

abstract class DriverInterface {
  Future<List<Driver>> fetchDrivers();
  Future<Driver> getDrivers(String id);
}
