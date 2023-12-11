import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/factories/features/daemon_factory.dart';
import 'package:reacthome/factories/features/discovery_factory.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/views/daemon_panel_view.dart';
import 'package:reacthome/util/event_bus.dart';

class DaemonPanelFactory {
  static final instance = DaemonPanelFactory._();

  late Widget discoveryPanel;
  late Widget daemonPanel;

  DaemonPanelFactory._() {
    discoveryPanel = _make(
      eventBus: DiscoveryFactory.instance.daemonEventBus,
      query: DiscoveryFactory.instance.daemonService,
      actor: DiscoveryFactory.instance.daemonService,
    );

    daemonPanel = _make(
      eventBus: DaemonFactory.instance.daemonEventBus,
      query: DaemonFactory.instance.daemonService,
      actor: DaemonFactory.instance.daemonService,
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
