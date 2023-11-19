import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/core/discovery/discovery_state.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryStatusViewModel extends GenericEventListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryQuery query;
  final DiscoveryCommand actor;
  DiscoveryStatusViewModel({
    required super.eventSource,
    required this.query,
    required this.actor,
  });

  bool get isDiscovering => query.getProcess().state == DiscoveryState.running;

  void toggleDiscovery(bool value) {
    if (value) {
      actor.start();
    } else {
      actor.stop();
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
