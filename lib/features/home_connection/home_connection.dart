import 'package:reacthome/features/connection/connection.dart';
import 'package:reacthome/features/entity.dart';

abstract interface class HomeConnection<S> implements Entity<String> {
  @override
  String get id;
  Connection<S>? get connection;
}
