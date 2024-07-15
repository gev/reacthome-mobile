import 'package:reacthome/application/connection/connection.dart';
import 'package:reacthome/entity_framework/core/entity.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
