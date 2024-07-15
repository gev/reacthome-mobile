import 'package:reacthome/application/connectivity/connectivity_event.dart';
import 'package:reacthome/application/connectivity/connectivity_state.dart';

abstract interface class Connectivity {
  ConnectivityState get state;
  ConnectivityEvent makeConnected(ConnectivityState state);
  ConnectivityEvent makeDisconnected();
}
