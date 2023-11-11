import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/util/entity.dart';

abstract interface class Connection implements Entity<String> {
  @override
  String get id;
  ConnectionState get state;
}
