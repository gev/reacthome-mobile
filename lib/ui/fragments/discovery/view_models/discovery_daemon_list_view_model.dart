import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/util/event_listener.dart';

class DiscoveryDaemonListViewModel extends GenericEventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonApi daemon;

  DiscoveryDaemonListViewModel({
    required super.eventSource,
    required this.daemon,
  });

  Iterable<String> get daemons => daemon.getAllDaemons();
  String get countTitle => daemons.length.toString();

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonAddedEvent _:
      case DaemonRemovedEvent _:
        notifyListeners();
      default:
    }
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }
}
