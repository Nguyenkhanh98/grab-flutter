import 'package:flutter_application_1/domain/entities/driver.dart';
import 'package:meta/meta.dart';

class DriverModel extends Driver {
  DriverModel({
    @required String id,
    @required String name,
    @required String phone,
    @required String description,
  }) : super(id: id, name: name, price: price, description: description);

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'],
      name: json['name'],
      phone: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': price,
      'description': description,
    };
  }
}
