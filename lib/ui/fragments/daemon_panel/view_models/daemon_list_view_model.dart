import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonListViewModel extends EventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonQuery discovery;

  DaemonListViewModel(this.discovery,
      {required EventBus<DaemonEvent> eventSource})
      : super(eventSource);

  Iterable<String> get daemons => discovery.getAllDaemons();
  String get countTitle => daemons.length.toString();

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonEventAdded _:
      case DaemonEventRemoved _:
        notifyListeners();
      default:
    }
  }
}
