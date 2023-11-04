import 'package:flutter_application_1/common/exceptions/server_exceptions.dart';
import 'package:flutter_application_1/common/platform/connectivity.dart';
import 'package:flutter_application_1/domain/entities/ride.entity.dart';
import 'package:flutter_application_1/domain/interfaces/ride.interface.dart';
import 'package:flutter_application_1/infrastructure/data_sources/local/ride.local_data_provider.dart';
import 'package:flutter_application_1/infrastructure/data_sources/remote/ride.remote_data_provider.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

class RideRepository implements RideInterface {
  final Connectivity connectivity;
  final RideLocalDataProvider rideLocalDataProvider;
  final RideRemoteDataProvider rideRemoteDataProvider;

  RideRepository({
    required this.connectivity,
    required this.rideLocalDataProvider,
    required this.rideRemoteDataProvider,
  });

  @override
  Future<List<Ride>> fetchRides() async {
    if (connectivity.isConnected) {
      try {
        final List<Ride> rides = await rideRemoteDataProvider.fetchRide();
        // rideLocalDataProvider.cacheRides(rides);
        return rides;
      } catch (e) {
        return ServerException()(e);
      }
    } else {
      // return rideLocalDataProvider.fetchRide();
    }
    // TODO: implement fetchRides
    throw UnimplementedError();
  }

  @override
  Future<Ride> getDriver() {
    // TODO: implement getDriver
    throw UnimplementedError();
  }

  @override
  Future<Ride> getRides(String id) {
    // TODO: implement getRides
    throw UnimplementedError();
  }
}
