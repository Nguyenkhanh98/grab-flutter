import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

class ServerException implements Equatable {
  @override
  List<Object> get props => [{}];

  call(dynamic e) {
    Logger.root.severe('Failed $e');
  }

  @override
  bool get stringify => false;
}
