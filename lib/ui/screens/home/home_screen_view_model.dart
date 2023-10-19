import 'package:flutter/widgets.dart';
import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/core/discovery_process_event.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/listener.dart';

class HomeScreenViewModel extends BusListener<DiscoveryProcessEvent>
    with ChangeNotifier {
  final DiscoveryProcessService discovery;

  HomeScreenViewModel(this.discovery,
      {required Bus<DiscoveryProcessEvent> eventSource})
      : super(eventSource);

  String get counter => '0'; //discovery.counter.toString();

  void incrementCounter() {
    // discovery.increment();
  }

  @override
  void run(DiscoveryProcessEvent event) {
    // if (event == DiscoveryEvent.update) {
    //   notifyListeners();
    // }
  }
}
