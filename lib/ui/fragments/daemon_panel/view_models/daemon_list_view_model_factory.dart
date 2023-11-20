import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/factory.dart';

class DaemonListViewModelFactory implements Factory<DaemonListViewModel> {
  final EventBus<DaemonEvent> eventSource;
  final DaemonQuery query;

  DaemonListViewModelFactory({
    required this.eventSource,
    required this.query,
  });

  @override
  DaemonListViewModel create(BuildContext _) => DaemonListViewModel(
        query,
        eventSource: eventSource,
      );
}
