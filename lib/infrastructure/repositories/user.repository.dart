import 'package:flutter_application_1/common/exceptions/server_exceptions.dart';
import 'package:flutter_application_1/common/platform/connectivity.dart';
import 'package:flutter_application_1/domain/entities/ride.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_application_1/domain/interfaces/user.interface.dart';
import 'package:flutter_application_1/infrastructure/data_sources/local/user.local_data_provider.dart';
import 'package:flutter_application_1/infrastructure/data_sources/remote/user.remote_data_provider.dart';

class UserRepository implements UserInterface {
  final Connectivity connectivity;
  final UserLocalDataProvider userLocalDataProvider;
  final UserRemoteDataProvider userRemoteDataProvider;

  UserRepository({
    required this.connectivity,
    required this.userLocalDataProvider,
    required this.userRemoteDataProvider,
  });

  @override
  Future<User?> getProfile() async {
    if (connectivity.isConnected) {
      try {
        final User user = await userRemoteDataProvider.getProfile();
        // rideLocalDataProvider.cacheRides(rides);
        return user;
      } catch (e) {
        return ServerException()(e);
      }
    } else {
      return null;
      // return rideLocalDataProvider.fetchRide();
    }
  }

  @override
  Future<User?> login(LoginInput loginInput) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User?> register(
      {required String phone,
      required String countryCode,
      required String name}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
