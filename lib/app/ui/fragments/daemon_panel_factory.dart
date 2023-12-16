import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/app/features/daemon_factory.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/views/daemon_panel_view.dart';
import 'package:reacthome/util/event_bus.dart';

class DaemonPanelFactory {
  static final instance = DaemonPanelFactory._();

  DaemonPanelFactory._();

  Widget makeDiscoveryPanel() {
    final daemonService = DiscoveryFactory.instance.makeDaemonService();
    return _make(
      eventBus: DiscoveryFactory.instance.daemonEventBus,
      query: daemonService,
      actor: daemonService,
    );
  }

  Widget makeDaemonPanel() {
    final daemonService = DaemonFactory.instance.makeDaemonService();
    return _make(
      eventBus: DaemonFactory.instance.daemonEventBus,
      query: daemonService,
      actor: daemonService,
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
