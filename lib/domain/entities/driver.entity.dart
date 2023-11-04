import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'driver.entity.g.dart';

@JsonSerializable()
class Driver extends User {
  final num maxDistance; // km

  Driver({
    required String id,
    required String name,
    required String phoneNumber,
    required String countryCode,
    required String description,
    required UserType userType,
    required String username,
    required this.maxDistance,
  }) : super(
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          description: description,
          userType: userType,
          username: username,
        );
  @override
  List<Object> get props => [id, userType, username, description, maxDistance];

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
