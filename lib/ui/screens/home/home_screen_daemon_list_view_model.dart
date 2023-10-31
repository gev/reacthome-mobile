import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class HomeScreenDaemonListViewModel extends EventListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryQuery discovery;

  HomeScreenDaemonListViewModel(this.discovery,
      {required EventBus<DiscoveryEvent> eventSource})
      : super(eventSource);

  Iterable<String> get daemons => discovery.getAllDaemons();
  String get numberTitle => daemons.length.toString();

  @override
  void handle(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded _:
      case DiscoveryEventDaemonRemoved _:
        notifyListeners();
      default:
    }
  }
}
