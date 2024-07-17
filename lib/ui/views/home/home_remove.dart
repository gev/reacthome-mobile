import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/views/home/home_remove_confirm.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/util/navigator_extension.dart';

class HomeRemove extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const HomeRemove(this.id, this.viewModel, {super.key});

  void onHomeTileTap(String id, BuildContext context) async {
    final confirmed = await dialog.show<bool>(
      context,
      builder: (_) => HomeRemoveConfirm(id, viewModel),
    );
    if (confirmed == true) {
      viewModel.removeHome(id);
      if (context.mounted) {
        Navigator.of(context).clearNamed(
          NavigationRouteNames.homeList,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.removeThisHome),
          leading: Icon(icon.delete),
          onTap: () => onHomeTileTap(id, context),
        ),
      ],
    );
  }
}
