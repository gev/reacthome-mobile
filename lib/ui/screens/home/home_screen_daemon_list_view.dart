import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view_model.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view.dart';

class DaemonsList extends StatelessWidget {
  const DaemonsList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<HomeScreenDaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return Expanded(
      child: ListView(
        children:
            daemons.map((id) => daemonTile(key: ValueKey(id), id: id)).toList(),
      ),
    );
  }
}
