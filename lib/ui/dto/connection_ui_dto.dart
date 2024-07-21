import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_state.dart';

class ConnectionUiDto<S> {
  final bool isConnected;

  ConnectionUiDto(Connection<S>? connection)
      : isConnected = connection?.state == ConnectionState.connected;
}
