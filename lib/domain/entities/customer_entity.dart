import 'package:flutter_application_1/domain/entities/user.entity.dart';
import 'package:meta/meta.dart';

class Customer extends User {
  final bool isVip; // is Vip Customer

  Customer({
    required String id,
    required String name,
    required String phoneNumber,
    required String countryCode,
    required String description,
    required UserType userType,
    required String username,
    required this.isVip,
  }) : super(
          id: id,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          description: description,
          userType: userType,
          username: username,
          name: name,
        );
  @override
  List<Object> get props => [
        id,
        userType,
        username,
        description,
        isVip,
        name,
        phoneNumber,
        countryCode
      ];
}
