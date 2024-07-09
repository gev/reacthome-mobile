import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_confirm.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/navigator_extension.dart';

class DiscoveryHomeTile extends StatelessWidget {
  final String id;
  final DiscoveryViewModel discoveryViewModel;
  final HomeViewModel homeViewModel;

  const DiscoveryHomeTile(
    this.id,
    this.discoveryViewModel,
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
      if (discoveryViewModel.addHome(id)) {
        if (context.mounted) {
          Navigator.of(context).clearNamed(
            NavigationRouteNames.home,
            arguments: (home: id),
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
      stream: homeViewModel.stream(id, locale),
      initialData: homeViewModel.getHome(id, locale),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return list.tile(
          title: Text(home.meta.title),
          subtitle: Text(
            id,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading:
              Icon(home.hasProject ? icon.home.filled : icon.home.outlined),
          onTap: () => onHomeTileTap(id, context, locale),
        );
      },
    );
  }
}
