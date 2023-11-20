import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/connection/connection_vew_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_panel_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_add_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/util/factory.dart';

Widget daemonPanel({
  required Factory<ConnectionViewModel> connectionViewModelFactory,
  required Factory<DaemonListViewModel> daemonListViewModelFactory,
  required Factory<DaemonTitleViewModel> daemonTileViewModelFactory,
  required Factory<DaemonAddViewModel> daemonAddViewModelFactory,
}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: connectionViewModelFactory.create),
        ChangeNotifierProvider(create: daemonListViewModelFactory.create),
        ChangeNotifierProvider(create: daemonTileViewModelFactory.create),
        ChangeNotifierProvider(create: daemonAddViewModelFactory.create),
      ],
      child: const DaemonPanelView(),
    );
