import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_tile.dart';

class DaemonList extends StatelessWidget {
  const DaemonList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<DaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return Expanded(
      child: ListView(
        children:
            daemons.map((id) => DaemonTile(key: ValueKey(id), id: id)).toList(),
      ),
    );
  }
}
