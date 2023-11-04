import 'package:flutter_application_1/domain/entities/user.entity.dart';

abstract class UserInterface {
  Future<User?> getProfile();
  Future<User?> login(LoginInput loginInput);
  Future<User?> register(
      {required String phone,
      required String countryCode,
      required String name});
}
