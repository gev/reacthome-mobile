import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/common/view_model_builder.dart';
import 'package:reacthome/ui/navigation.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/util/navigator_extension.dart';

class HomeTile extends StatelessWidget {
  final String id;
  final HomesViewModel homeViewModel;

  const HomeTile(this.id, this.homeViewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return ViewModelBuilder(
        create: () => homeViewModel.makeViewModel(id, locale),
        builder: (context, viewModel, _) {
          final home = viewModel.home;
          return list.tile(
            title: Text(home.meta.name),
            subtitle: Text(
              id,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            leading:
                Icon(home.hasProject ? icon.home.filled : icon.home.outlined),
            trailing: list.chevron(),
            onTap: () {
              viewModel.setCurrentHome();
              Navigator.of(context).clearNamed(
                NavigationRouteNames.home,
                arguments: (id: id),
              );
            },
          );
        });
  }
}
