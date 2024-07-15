import 'package:reacthome/features/connection/connection_state.dart';
import 'package:reacthome/features/entity.dart';

import 'connection_type.dart';

abstract interface class Connection<S> implements Entity<String> {
  @override
  String get id;
  ConnectionType get type;
  ConnectionState get state;
  S get socket;
}
