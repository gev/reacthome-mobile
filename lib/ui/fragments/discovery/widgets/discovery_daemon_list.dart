import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_daemon_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryDaemonList extends StatelessWidget {
  final String title;
  final Widget ifEmpty;
  const DiscoveryDaemonList(
      {required this.title, required this.ifEmpty, super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<DiscoveryDaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return daemons.isEmpty
        ? ifEmpty
        : list.section(
            context,
            title: title,
            children: daemons
                .map((id) => DiscoveryDaemonTile(key: ValueKey(id), id: id))
                .toList(),
          );
  }
}
