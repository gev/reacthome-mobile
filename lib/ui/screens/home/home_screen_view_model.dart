import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_listener.dart';
import 'package:uuid/uuid.dart';

class HomeScreenViewModel extends BusListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryService discovery;

  HomeScreenViewModel(this.discovery,
      {required Bus<DiscoveryEvent> eventSource})
      : super(eventSource);

  List<String> get daemons => discovery.daemons;
  String get number => daemons.length.toString();

  final _uuid = const Uuid();

  void addDaemon() {
    discovery.addDaemon(_uuid.v4());
  }

  @override
  void run(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonAdded _:
      case DiscoveryEventDaemonRemoved _:
        notifyListeners();
      default:
    }
  }
}
