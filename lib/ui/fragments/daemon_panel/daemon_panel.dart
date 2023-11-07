import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_command_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/util/event_bus.dart';

Widget daemonPanel(
    ({
      EventBus<DaemonEvent> eventBus,
      DaemonQuery query,
      DaemonCommand actor,
    }) discovery) {
  final daemonListViewModel =
      DaemonListViewModel(discovery.query, eventSource: discovery.eventBus);
  final daemonTileViewModel =
      DaemonTitleViewModel(discovery.query, eventSource: discovery.eventBus);
  final addButtonViewModel = DaemonCommandViewModel(discovery.actor);
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => daemonListViewModel),
      ChangeNotifierProvider(create: (_) => daemonTileViewModel),
      ChangeNotifierProvider(create: (_) => addButtonViewModel),
    ],
    child: const DaemonPanelView(),
  );
}
