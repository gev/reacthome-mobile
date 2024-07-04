import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';

class DiscoveryStatusViewModel {
  final Stream<DiscoveryEvent> eventSource;
  final DiscoveryApi discovery;

  const DiscoveryStatusViewModel({
    required this.eventSource,
    required this.discovery,
  });

  bool get initialState => false;

  Stream<bool> get stream =>
      eventSource.map((event) => event is DiscoveryStartCompletedEvent);

  void onSwitchTap(bool value) {
    if (value) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }
}
