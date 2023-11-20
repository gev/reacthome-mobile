import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/daemon.dart';
import 'package:reacthome/app/features/discovery.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/views/daemon_panel_view.dart';
import 'package:reacthome/util/event_bus.dart';

class DaemonPanel {
  static final instance = DaemonPanel._();

  late Widget discoveryPanel;
  late Widget daemonPanel;

  DaemonPanel._() {
    discoveryPanel = _make(
      eventBus: Discovery.instance.daemonEventBus,
      query: Discovery.instance.daemonService,
      actor: Discovery.instance.daemonService,
    );

    daemonPanel = _make(
      eventBus: Daemon.instance.daemonEventBus,
      query: Daemon.instance.daemonService,
      actor: Daemon.instance.daemonService,
    );
  }
}

Widget _make({
  required EventBus<DaemonEvent> eventBus,
  required DaemonQuery query,
  required DaemonCommand actor,
}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DaemonListViewModel(
                  eventSource: eventBus,
                  query: query,
                )),
        ChangeNotifierProvider(
            create: (_) => DaemonTitleViewModel(
                  eventSource: eventBus,
                  query: query,
                )),
        ChangeNotifierProvider(
            create: (_) => DaemonAddViewModel(
                  actor: actor,
                )),
      ],
      child: const DaemonPanelView(),
    );
