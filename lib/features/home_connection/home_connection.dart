import 'package:reacthome/entity_framework/entity.dart';
import 'package:reacthome/features/connection/connection.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
