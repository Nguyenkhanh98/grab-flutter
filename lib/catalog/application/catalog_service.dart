import 'package:flutter_application_1/catalog/domain/entities/driver.dart';
import 'package:flutter_application_1/catalog/domain/logic/catalog.logic.dart';
import 'package:flutter_application_1/catalog/infrastructure/models/driver.model.dart';
import 'package:flutter_application_1/catalog/infrastructure/repositories/driver.repository.dart';

class CatalogService with CatalogLogic {
  const CatalogService({
    this.repository,
  });

  final DriverRepository repository;

  Future<List<Driver>> fetchProducts() async {
    return repository.fetchDrivers();
  }

  Future<Driver> getProduct(String id) async {
    return repository.getDrivers(id);
  }
}
