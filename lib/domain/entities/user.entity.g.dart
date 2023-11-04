// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      username: json['username'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'username': instance.username,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'description': instance.description,
    };

const _$UserTypeEnumMap = {
  UserType.customer: 'customer',
  UserType.driver: 'driver',
  UserType.admin: 'admin',
};

LoginInput _$LoginInputFromJson(Map<String, dynamic> json) => LoginInput(
      phone: json['phone'] as String,
      countryCode: json['countryCode'] as String,
    );

Map<String, dynamic> _$LoginInputToJson(LoginInput instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'countryCode': instance.countryCode,
    };
