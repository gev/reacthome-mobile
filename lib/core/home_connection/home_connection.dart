import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/entity.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
