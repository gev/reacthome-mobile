import 'package:flutter/widgets.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/utils/event_bus.dart';

class HomeScreenViewModel extends ChangeNotifier
    with EventHandler<DiscoveryEvent> {
  final DiscoveryService discovery;

  HomeScreenViewModel(this.discovery);

  String get counter => discovery.counter.toString();

  void incrementCounter() {
    discovery.increment();
  }

  @override
  void handleEvent(DiscoveryEvent event) {
    if (event is DiscoveryEventCounterChanged) {
      notifyListeners();
    }
  }
}
