// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      id: json['id'] as String,
      driverId: json['driverId'] as String,
      customerId: json['customerId'] as String,
      from: Location.fromJson(json['from'] as Map<String, dynamic>),
      to: Location.fromJson(json['to'] as Map<String, dynamic>),
      price: json['price'] as num,
      distance: json['distance'] as num,
      date: DateTime.parse(json['date'] as String),
      time: DateTime.parse(json['time'] as String),
      isFinished: json['isFinished'] as bool,
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'from': instance.from,
      'to': instance.to,
      'price': instance.price,
      'distance': instance.distance,
      'date': instance.date.toIso8601String(),
      'time': instance.time.toIso8601String(),
      'isFinished': instance.isFinished,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.waiting: 'waiting',
  Status.accepted: 'accepted',
  Status.onTheWay: 'onTheWay',
  Status.arrived: 'arrived',
  Status.finished: 'finished',
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
