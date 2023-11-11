import 'package:reacthome/core/connection/connection.dart';

abstract interface class ConnectionQuery {
  Iterable<String> getAllConnections();
  Connection getConnectionById(String id);
}
