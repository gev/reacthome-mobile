import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/features/connectivity/application/connectivity_service.dart';
import 'package:reacthome/features/connectivity/domain/connectivity_entity.dart';
import 'package:reacthome/features/connectivity/infrastructure/connectivity_change_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';

class ConnectivityFactory {
  static final instance = ConnectivityFactory._();

  ConnectivityFactory._();

  final connectivity = ConnectivityEntity();

  final connectivityEventBus = Bus<ConnectivityEvent>();

  ConnectivityApi makeConnectivityService() => ConnectivityService(
        eventSink: connectivityEventBus.sink,
        connectivity: connectivity,
      );

  ConnectivityChangeService makeConnectivityChangeService() =>
      ConnectivityChangeService(
        connectivity: makeConnectivityService(),
      );
}
