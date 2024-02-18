import 'package:reacthome/core/discovery/discovery.dart';

abstract interface class DiscoveryApi<S> {
  Discovery getProcess();
  void start();
  void completeStart(S source);
  void stop();
  void completeStop();
}
