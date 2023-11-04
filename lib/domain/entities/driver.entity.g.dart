// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      description: json['description'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      username: json['username'] as String,
      maxDistance: json['maxDistance'] as num,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'username': instance.username,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'description': instance.description,
      'maxDistance': instance.maxDistance,
    };

const _$UserTypeEnumMap = {
  UserType.customer: 'customer',
  UserType.driver: 'driver',
  UserType.admin: 'admin',
};
