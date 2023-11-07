import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserRemoteDataProvider {
  Future<User> getProfile() {
    return Future.value(null);
  }

  Future<User> login() {
    return Future.value(null);
  }

  Future<User> register() {
    return Future.value(null);
  }
}
