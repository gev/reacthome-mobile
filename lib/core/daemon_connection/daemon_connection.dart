import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/util/entity.dart';

abstract interface class DaemonConnection implements Entity<String> {
  @override
  String get id;
  Connection get local;
  Connection get cloud;
  Connection? get active;
}
