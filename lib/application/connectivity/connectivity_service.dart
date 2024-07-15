import 'package:reacthome/application/connectivity/connectivity.dart';
import 'package:reacthome/application/connectivity/connectivity_api.dart';
import 'package:reacthome/application/connectivity/connectivity_event.dart';
import 'package:reacthome/application/connectivity/connectivity_state.dart';
import 'package:reacthome/entity_framework/core/emitter.dart';

class ConnectivityService implements ConnectivityApi {
  final Emitter<ConnectivityEvent> eventSink;
  final Connectivity connectivity;

  const ConnectivityService({
    required this.eventSink,
    required this.connectivity,
  });

  @override
  ConnectivityState get state => connectivity.state;

  @override
  void makeConnected(ConnectivityState state) => eventSink.emit(
        connectivity.makeConnected(state),
      );

  @override
  void makeDisconnected() => eventSink.emit(
        connectivity.makeDisconnected(),
      );
}
