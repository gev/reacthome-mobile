import 'package:reacthome/core/connectivity/connectivity.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/connectivity/connectivity_event.dart';
import 'package:reacthome/core/connectivity/connectivity_state.dart';
import 'package:reacthome/infrastructure/bus/bus_emitter.dart';

class ConnectivityService extends GenericBusEmitter<ConnectivityEvent>
    implements ConnectivityApi {
  final Connectivity connectivity;

  const ConnectivityService({
    required super.eventSink,
    required this.connectivity,
  });

  @override
  ConnectivityState get state => connectivity.state;

  @override
  void makeConnected(ConnectivityState state) => emit(
        connectivity.makeConnected(state),
      );

  @override
  void makeDisconnected() => emit(
        connectivity.makeDisconnected(),
      );
}
