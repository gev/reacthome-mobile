import 'package:reacthome/core/connectivity/connectivity_state.dart';

sealed class ConnectivityEvent {}

class ConnectivityConnectedEvent extends ConnectivityEvent {
  final ConnectivityState state;
  ConnectivityConnectedEvent(this.state);
}

class ConnectivityDisconnectedEvent extends ConnectivityEvent {}
