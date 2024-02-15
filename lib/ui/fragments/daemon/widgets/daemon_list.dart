import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon/view_models/daemon_list_view_model.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_tile.dart';
import 'package:reacthome/ui/widgets/list/list_section/list_section.dart';

class DaemonList extends StatelessWidget {
  final String title;
  final Widget ifEmpty;
  const DaemonList({required this.title, required this.ifEmpty, super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> daemons =
        context.select<DaemonListViewModel, Iterable<String>>(
            (model) => model.daemons);
    return daemons.isEmpty
        ? ifEmpty
        : ListSection(
            title: title,
            children: daemons
                .map((id) => DaemonTile(key: ValueKey(id), id: id))
                .toList(),
          );
  }
}
