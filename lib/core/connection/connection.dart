import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/util/entity.dart';

import 'connection_type.dart';

abstract interface class Connection implements Entity<String> {
  @override
  String get id;
  ConnectionType get type;
  ConnectionState get state;
}
