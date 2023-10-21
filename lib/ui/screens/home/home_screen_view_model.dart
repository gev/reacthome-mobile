import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';

class HomeScreenViewModel extends BusListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryService discovery;

  HomeScreenViewModel(this.discovery,
      {required Bus<DiscoveryEvent> eventSource})
      : super(eventSource);

  String get counter => discovery.daemons.length.toString();

  void incrementCounter() {
    // discovery.increment();
  }

  @override
  void run(_) {
    notifyListeners();
  }
}
