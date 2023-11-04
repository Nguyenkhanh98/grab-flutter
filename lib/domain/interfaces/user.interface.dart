import 'package:flutter_application_1/domain/entities/ride.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';

abstract class UserInterface {
  Future<User> getProfile();
  Future<Ride> getRide();
}
