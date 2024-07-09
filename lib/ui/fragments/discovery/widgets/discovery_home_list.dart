import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_confirm.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_tile.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/navigator_extension.dart';

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

  void onHomeTileTap(
      String id, BuildContext context, AppLocalizations locale) async {
    final confirmed = await dialog.show<bool>(
      context,
      builder: (_) => DiscoveryHomeAddConfirm(id, homeViewModel),
    );
    if (confirmed == true) {
      if (discoveryViewModel.tryAddHome(id)) {
        if (context.mounted) {
          Navigator.of(context).clearNamed(
            NavigationRouteNames.home,
            arguments: (id: id),
          );
        }
      } else {
        if (context.mounted) {
          dialog.show(
            context,
            builder: (_) => const DiscoveryHomeAddAlert(),
          );
        }
      }
    }
  }

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
                            key: ValueKey(id),
                            discoveryViewModel,
                            homeViewModel,
                            onTap: () => onHomeTileTap(id, context, locale),
                          ))
                      .toList(),
                );
        });
  }
}
