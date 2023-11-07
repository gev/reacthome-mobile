import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/core/daemon/daemon_command.dart';
import 'package:reacthome/core/daemon/daemon_event.dart';
import 'package:reacthome/core/daemon/daemon_query.dart';
import 'package:reacthome/ui/fragments/daemon_panel/add_daemon_button_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_tile_view_model.dart';
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
      DaemonTileViewModel(discovery.query, eventSource: discovery.eventBus);
  final addButtonViewModel = AddDaemonButtonViewModel(discovery.actor);
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => daemonListViewModel),
      ChangeNotifierProvider(create: (_) => daemonTileViewModel),
      ChangeNotifierProvider(create: (_) => addButtonViewModel),
    ],
    child: const DaemonPanel(),
  );
}
