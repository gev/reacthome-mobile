import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryStatusViewModel extends GenericEventListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryApi discovery;
  DiscoveryStatusViewModel({
    required super.eventSource,
    required this.discovery,
  });

  bool get isDiscovering =>
      discovery.getProcess().state == DiscoveryState.running;

  void toggleDiscovery(bool value) {
    if (value) {
      discovery.start();
    } else {
      discovery.stop();
    }
  }

  @override
  void handle(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryStartCompletedEvent _:
      case DiscoveryStopCompletedEvent _:
        notifyListeners();
      default:
    }
  }
}
