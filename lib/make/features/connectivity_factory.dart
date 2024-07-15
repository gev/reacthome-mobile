import 'package:reacthome/features/connectivity/connectivity_api.dart';
import 'package:reacthome/features/connectivity/connectivity_change_service.dart';
import 'package:reacthome/features/connectivity/connectivity_entity.dart';
import 'package:reacthome/features/connectivity/connectivity_event.dart';
import 'package:reacthome/features/connectivity/connectivity_service.dart';
import 'package:reacthome/infrastructure/bus/bus.dart';

class ConnectivityFactory {
  static final instance = ConnectivityFactory._();

  ConnectivityFactory._();

  final connectivity = ConnectivityEntity();

  final connectivityEventBus = Bus<ConnectivityEvent>();

  ConnectivityApi makeConnectivityApi() => ConnectivityService(
        eventSink: connectivityEventBus.sink,
        connectivity: connectivity,
      );

  ConnectivityChangeService makeConnectivityChangeService() =>
      ConnectivityChangeService(
        connectivity: makeConnectivityApi(),
      );
}
