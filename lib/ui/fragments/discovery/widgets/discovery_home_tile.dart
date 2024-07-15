import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';

class DiscoveryHomeTile extends StatelessWidget {
  final String id;
  final DiscoveryViewModel discoveryViewModel;
  final HomeViewModel homeViewModel;
  final void Function() onTap;

  const DiscoveryHomeTile(
    this.id,
    this.discoveryViewModel,
    this.homeViewModel, {
    required this.onTap,
    super.key,
  });

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
          onTap: onTap,
        );
      },
    );
  }
}
