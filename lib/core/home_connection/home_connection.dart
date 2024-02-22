import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/util/entity.dart';

abstract interface class HomeConnection implements Entity<String> {
  @override
  String get id;
  Connection? get connection;
}
