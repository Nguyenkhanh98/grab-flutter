import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ride.entity.g.dart';

@JsonSerializable()
class Ride extends Equatable {
  final String id;
  final String driverId;
  final String customerId;
  final Location from;
  final Location to;
  final num price;
  final num distance;
  final DateTime date;
  final DateTime time;
  final bool isFinished;
  final Status status;

  Ride({
    required this.id,
    required this.driverId,
    required this.customerId,
    required this.from,
    required this.to,
    required this.price,
    required this.distance,
    required this.date,
    required this.time,
    required this.isFinished,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        driverId,
        customerId,
        from,
        to,
        price,
        distance,
        date,
        time,
        isFinished,
        status
      ];

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);
  Map<String, dynamic> toJson() => _$RideToJson(this);
}

@JsonSerializable()
class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

enum Status { waiting, accepted, onTheWay, arrived, finished }
