import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/services/discovery/discovery_service.dart';
import 'package:reacthome/utils/event_bus.dart';

class HomeScreenViewModel extends ChangeNotifier
    implements EventHandler<DiscoveryEvent> {
  final DiscoveryService discovery;
  late StreamSubscription<DiscoveryEvent> _subscription;

  HomeScreenViewModel(EventBus<DiscoveryEvent> eventBus, this.discovery) {
    _subscription = eventBus.subscribe(this);
  }

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

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
