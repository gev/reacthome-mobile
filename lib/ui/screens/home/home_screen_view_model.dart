import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_model.dart';
import 'package:reacthome/util/event_listener.dart';

class HomeScreenViewModel extends ChangeNotifier
    with EventListener<DiscoveryEvent> {
  final DiscoveryModel discovery;

  HomeScreenViewModel(this.discovery);

  String get counter => discovery.counter.toString();

  void incrementCounter() {
    discovery.increment();
  }

  @override
  void onData(DiscoveryEvent event) {
    if (event is DiscoveryEventCounterChanged) {
      notifyListeners();
    }
  }
}
