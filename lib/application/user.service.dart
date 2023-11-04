import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:flutter_application_1/infrastructure/repositories/user.repository.dart';

class UserService {
  const UserService({
    required this.repository,
  });

  final UserRepository repository;

  Future<User?> getUser() async {
    return repository.getProfile();
  }
}
