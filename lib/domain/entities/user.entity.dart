import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum UserType { customer, driver, admin }

@JsonSerializable()
class LoginInput extends Equatable {
  final String phone;
  final String countryCode;
  LoginInput({required this.phone, required this.countryCode});
  @override
  List<Object> get props => [phone, countryCode];

  factory LoginInput.fromJson(Map<String, dynamic> json) =>
      _$LoginInputFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
