import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeList extends StatelessWidget {
  final String title;
  final Widget ifEmpty;
  const DiscoveryHomeList(
      {required this.title, required this.ifEmpty, super.key});

  @override
  Widget build(BuildContext context) {
    Iterable<String> homes =
        context.select<DiscoveryHomeListViewModel, Iterable<String>>(
            (model) => model.homes);
    return homes.isEmpty
        ? ifEmpty
        : list.section(
            context,
            title: title,
            children: homes
                .map((id) => DiscoveryHomeTile(key: ValueKey(id), id: id))
                .toList(),
          );
  }
}
