import 'package:reacthome/features/application/connection/connection.dart';
import 'package:reacthome/features/entity.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
