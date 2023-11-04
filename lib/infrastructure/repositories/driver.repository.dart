import 'package:flutter_application_1/domain/entities/driver.entity.dart';
import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_application_1/infrastructure/data_sources/remote/driver.rdp.dart';
import 'package:flutter_application_1/common/exceptions/server_exceptions.dart';
import 'package:flutter_application_1/common/platform/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_1/domain/interfaces/driver.interface.dart';

@Injectable()
class DriverRepository implements DriverInterface {
  final Connectivity connectivity;
  final DriverRemoteDataProvider driverRemoteDataProvider;

  DriverRepository({
    required this.connectivity,
    required this.driverRemoteDataProvider,
  });

  @override
  Future<User?> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Driver?> login(LoginInput loginInput) async {
    return await driverRemoteDataProvider.login(loginInput);
  }

  @override
  Future<Driver?> register(
      {required String phone,
      required String countryCode,
      required String name}) async {
    return await driverRemoteDataProvider.register(
        phone: phone, countryCode: countryCode, name: name);
  }
}
