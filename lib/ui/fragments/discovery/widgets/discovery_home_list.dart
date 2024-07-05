import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/service_locator.dart';

class DiscoveryHomeList extends StatelessWidget {
  final String title;
  const DiscoveryHomeList({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = $.get<DiscoveryHomeListViewModel>();
    return StreamBuilder(
        stream: viewModel.stream,
        initialData: viewModel.homes,
        builder: (context, snapshot) {
          final homes = snapshot.data!;
          return homes.isEmpty
              ? const SizedBox()
              : list.section(
                  context,
                  title: title,
                  children: homes
                      .map((id) => DiscoveryHomeTile(key: ValueKey(id), id: id))
                      .toList(),
                );
        });
  }
}
