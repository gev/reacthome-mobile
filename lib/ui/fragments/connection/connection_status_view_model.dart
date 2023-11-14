import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/connection/connection_state.dart';
import 'package:reacthome/util/event_listener.dart';

class ConnectionStatusViewModel extends EventListener<ConnectionEvent>
    with ChangeNotifier {
  final ConnectionQuery localQuery;
  final ConnectionQuery cloudQuery;
  ConnectionStatusViewModel({
    required super.eventSource,
    required this.localQuery,
    required this.cloudQuery,
  });

  String connectionStatus(String id) {
    final hasLocal = hasLocalConnection(id);
    final hasCloud = hasCloudConnection(id);
    return [
      if (hasLocal) 'Local',
      if (hasCloud) 'Cloud',
    ].join(' ');
  }

  bool hasLocalConnection(String id) =>
      _isConnected(localQuery.getConnectionById(id));

  bool hasCloudConnection(String id) =>
      _isConnected(cloudQuery.getConnectionById(id));

  bool _isConnected(Connection connection) =>
      connection.state == ConnectionState.connected;

  @override
  void handle(ConnectionEvent event) {
    switch (event) {
      case ConnectionEventConnectCompleted _:
      case ConnectionEventDisconnectCompleted _:
        notifyListeners();
      default:
    }
  }
}
