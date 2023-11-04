import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

class LocalException extends Equatable {
  @override
  List<Object> get props => [
        {null}
      ];

  call(dynamic e) {
    Logger.root.severe('Client Failed $e');
  }
}
