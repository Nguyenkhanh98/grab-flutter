import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final UserType userType;
  final String username;
  final String name;
  final String phoneNumber;
  final String countryCode;
  final String description;

  User({
    required this.id,
    required this.userType,
    required this.username,
    required this.phoneNumber,
    required this.countryCode,
    required this.description,
    required this.name,
  });

  @override
  List<Object> get props => [id, userType, username, description];
}

enum UserType { customer, driver, admin }
