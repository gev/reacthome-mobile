import 'package:flutter/widgets.dart';
import 'package:reacthome/core/connection/connection.dart';
import 'package:reacthome/core/connection/connection_event.dart';
import 'package:reacthome/core/connection/connection_query.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection.dart';
import 'package:reacthome/core/daemon_connection/daemon_connection_command.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/factory.dart';

class ConnectionViewModelFactory implements Factory<ConnectionViewModel> {
  final EventBus<ConnectionEvent> eventSource;
  final ({
    ConnectionQuery<DaemonConnection> query,
    DaemonConnectionCommand actor,
  }) daemonConnection;
  final ({
    ConnectionQuery<Connection> query,
  }) local;
  final ({
    ConnectionQuery<Connection> query,
  }) cloud;
  final ({
    DaemonQuery query,
  }) daemon;

  ConnectionViewModelFactory({
    required this.eventSource,
    required this.daemonConnection,
    required this.local,
    required this.cloud,
    required this.daemon,
  });

  @override
  ConnectionViewModel create(BuildContext _) => ConnectionViewModel(
        eventSource: eventSource,
        daemonConnection: daemonConnection,
        local: local,
        cloud: cloud,
        daemon: daemon,
      );
}
