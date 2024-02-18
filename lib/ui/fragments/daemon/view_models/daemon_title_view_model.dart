import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_api.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonTitleViewModel extends GenericEventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonApi daemon;

  DaemonTitleViewModel({
    required super.eventSource,
    required this.daemon,
  });

  String? getDaemonTitleById(String id) => daemon.getDaemonById(id)?.meta.name;

  bool hasProject(String id) => daemon.getDaemonById(id)?.project != null;

  @override
  void handle(DaemonEvent event) {
    switch (event) {
      case DaemonMetaChangedEvent _:
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
