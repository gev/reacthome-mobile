import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_tile.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeList extends StatelessWidget {
  final DiscoveryViewModel discoveryViewModel;
  final HomeListViewModel homeListViewModel;
  final HomeViewModel homeViewModel;

  const DiscoveryHomeList(
    this.discoveryViewModel,
    this.homeListViewModel,
    this.homeViewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return StreamBuilder(
        stream: homeListViewModel.stream,
        initialData: homeListViewModel.homes,
        builder: (context, snapshot) {
          final homes = snapshot.data!;
          return homes.isEmpty
              ? const SizedBox()
              : list.section(
                  context,
                  title: locale.discovered,
                  children: homes
                      .map((id) => DiscoveryHomeTile(
                            id,
                            discoveryViewModel,
                            homeViewModel,
                            key: ValueKey(id),
                          ))
                      .toList(),
                );
        });
  }
}
