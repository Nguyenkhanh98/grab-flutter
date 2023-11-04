import 'package:flutter_application_1/domain/entities/ride.entity.dart';

abstract class RideInterface {
  Future<List<Ride>> fetchRides();
  Future<Ride> getRides(String id);
  Future<Ride> getDriver();
}
