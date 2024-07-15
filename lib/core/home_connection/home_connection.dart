import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/entity_framework/entity.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
