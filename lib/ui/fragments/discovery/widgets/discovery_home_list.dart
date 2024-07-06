import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_tile.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeList extends StatelessWidget {
  final String title;
  final DiscoveryHomeViewModel homeViewModel;
  final DiscoveryHomeListViewModel homeListViewModel;

  const DiscoveryHomeList({
    required this.homeViewModel,
    required this.homeListViewModel,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeListViewModel.stream,
        initialData: homeListViewModel.homes,
        builder: (context, snapshot) {
          final homes = snapshot.data!;
          return homes.isEmpty
              ? const SizedBox()
              : list.section(
                  context,
                  title: title,
                  children: homes
                      .map((id) => DiscoveryHomeTile(
                          key: ValueKey(id), id: id, viewModel: homeViewModel))
                      .toList(),
                );
        });
  }
}
