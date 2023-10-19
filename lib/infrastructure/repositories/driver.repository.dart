import 'package:flutter_application_1/infrastructure/data_sources/driver_local_data_provider.dart';
import 'package:flutter_application_1/infrastructure/data_sources/driver_remote_data_provider.dart';
import 'package:flutter_application_1/infrastructure/models/driver.model.dart';
import 'package:flutter_application_1/common/exceptions/server_exceptions.dart';
import 'package:flutter_application_1/common/platform/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_1/domain/entities/driver.dart';
import 'package:flutter_application_1/domain/interfaces/driver.interface.dart';

class DriverRepository implements DriverInterface {
  final Connectivity connectivity;
  final ProductLocalDataProvider productLocalDataProvider;
  final ProductRemoteDataProvider productRemoteDataProvider;

  DriverRepository({
    @required this.connectivity,
    @required this.productLocalDataProvider,
    @required this.productRemoteDataProvider,
  });

  @override
  Future<List<DriverModel>> fetchDrivers() async {
    if (connectivity.isConnected) {
      try {
        final List<DriverModel> drivers =
            await productRemoteDataProvider.fetchDriver();
        productLocalDataProvider.cacheProducts(drivers);
        return drivers;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      return productLocalDataProvider.fetchProduct();
    }
  }

  @override
  Future<DriverModel> getDrivers(String id) async {
    if (connectivity.isConnected) {
      try {
        final DriverModel product =
            await productRemoteDataProvider.getDriver(id);
        // cache product
        productLocalDataProvider.cacheProduct(product);
        return product;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      return productLocalDataProvider.getProduct(id);
    }
  }
}
