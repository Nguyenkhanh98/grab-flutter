import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Driver extends Equatable {
  final String id;
  final String name;
  final num price;
  final String description;

  Driver({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
  });

  @override
  List<Object> get props => <dynamic>[id, name, price, description];
}
