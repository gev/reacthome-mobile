import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/listener.dart';

class HomeScreenViewModel extends BusListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryService discovery;

  HomeScreenViewModel(this.discovery,
      {required Bus<DiscoveryEvent> eventSource})
      : super(eventSource);

  String get counter => '0'; //discovery.counter.toString();

  void incrementCounter() {
    // discovery.increment();
  }

  @override
  void run(DiscoveryEvent event) {
    // if (event == DiscoveryEvent.update) {
    //   notifyListeners();
    // }
  }
}
