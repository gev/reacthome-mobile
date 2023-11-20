import 'package:flutter/widgets.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/factory.dart';

class DaemonTitleViewModelFactory implements Factory<DaemonTitleViewModel> {
  final EventBus<DaemonEvent> eventSource;
  final DaemonQuery query;

  DaemonTitleViewModelFactory({
    required this.eventSource,
    required this.query,
  });

  @override
  DaemonTitleViewModel create(BuildContext _) => DaemonTitleViewModel(
        query,
        eventSource: eventSource,
      );
}
