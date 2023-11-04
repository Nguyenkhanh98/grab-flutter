// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      description: json['description'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      username: json['username'] as String,
      isVip: json['isVip'] as bool,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'username': instance.username,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'description': instance.description,
      'isVip': instance.isVip,
    };

const _$UserTypeEnumMap = {
  UserType.customer: 'customer',
  UserType.driver: 'driver',
  UserType.admin: 'admin',
};
