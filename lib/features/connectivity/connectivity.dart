import 'package:reacthome/features/connectivity/connectivity_event.dart';
import 'package:reacthome/features/connectivity/connectivity_state.dart';

abstract interface class Connectivity {
  ConnectivityState get state;
  ConnectivityEvent makeConnected(ConnectivityState state);
  ConnectivityEvent makeDisconnected();
}
