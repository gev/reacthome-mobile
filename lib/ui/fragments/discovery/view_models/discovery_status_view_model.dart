import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';

class DiscoveryStatusViewModel {
  final Stream<DiscoveryEvent> eventSource;
  final DiscoveryApi discovery;

  const DiscoveryStatusViewModel({
    required this.eventSource,
    required this.discovery,
  });

  bool get initialState => discovery.state == DiscoveryState.running;

  Stream<bool> get stream =>
      eventSource.map((event) => event is DiscoveryStartCompletedEvent);

  void onDiscoverySwitchTap(bool value) {
    if (value) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }
}
