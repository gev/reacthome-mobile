import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_tile.dart';
import 'package:reacthome/ui/widgets/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view.dart';

class DaemonList extends StatelessWidget {
  const DaemonList({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<DaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return Expanded(
      child: ListView(children: [
        ListSection(
          title: 'Available around',
          children: daemons
              .map((id) => DaemonTile(key: ValueKey(id), id: id))
              .toList(),
        ),
        ListTile(title: 'Add by ID'),
      ]),
    );
  }
}
