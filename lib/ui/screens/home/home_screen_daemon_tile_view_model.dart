import 'package:flutter/widgets.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class HomeScreenDaemonTileViewModel extends EventListener<DiscoveryEvent>
    with ChangeNotifier {
  final DiscoveryQuery discovery;

  HomeScreenDaemonTileViewModel(this.discovery,
      {required EventBus<DiscoveryEvent> eventSource})
      : super(eventSource);

  String getDaemonTitleById(String id) {
    final daemon = discovery.getDaemonById(id);
    return daemon?.meta.name ?? id;
  }

  @override
  void handle(DiscoveryEvent event) {
    switch (event) {
      case DiscoveryEventDaemonMetaChanged _:
        notifyListeners();
      default:
    }
  }
}
