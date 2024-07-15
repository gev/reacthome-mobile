import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/util/navigator_extension.dart';

class HomeTile extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const HomeTile(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return StreamBuilder(
        stream: viewModel.stream(id, locale),
        initialData: viewModel.getHome(id, locale),
        builder: (context, snapshot) {
          final home = snapshot.data!;
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
            onTap: () => Navigator.of(context).clearNamed(
              NavigationRouteNames.home,
              arguments: (id: id),
            ),
          );
        });
  }
}
