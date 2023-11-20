import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonListViewModel extends GenericEventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonQuery query;

  DaemonListViewModel(
    this.query, {
    required super.eventSource,
  });

  Iterable<String> get daemons => query.getAllDaemons();
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
}
