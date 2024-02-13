import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/util/event_listener.dart';

class DaemonTitleViewModel extends GenericEventListener<DaemonEvent>
    with ChangeNotifier {
  final DaemonQuery query;

  DaemonTitleViewModel({
    required super.eventSource,
    required this.query,
  });

  String getDaemonTitleById(String id) {
    final daemon = query.getDaemonById(id);
    return daemon?.meta.name ?? id;
  }

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
