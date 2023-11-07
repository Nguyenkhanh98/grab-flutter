import 'package:flutter_application_1/domain/entities/ride.entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class RideRemoteDataProvider {
  Future<List<Ride>> fetchRide() {
    return Future.value([]);
  }

  Future<Ride> getDriver(String id) {
    return Future.value(null);
  }
}
