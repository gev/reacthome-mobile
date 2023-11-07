import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonTileViewModel extends EventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonQuery discovery;

  DaemonTileViewModel(this.discovery,
      {required EventBus<DaemonEvent> eventSource})
      : super(eventSource);

  String getDaemonTitleById(String id) {
    final daemon = discovery.getDaemonById(id);
    return daemon?.meta.name ?? id;
  }

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonEventMetaChanged _:
        notifyListeners();
      default:
    }
  }
}
