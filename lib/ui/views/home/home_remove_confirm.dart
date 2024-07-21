import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class HomeRemoveConfirm extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const HomeRemoveConfirm(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final home = viewModel.getHome(id, locale);
        return confirm(
          context,
          title: Text(home.meta.name),
          isDestructive: true,
          content: Text(locale.doYouWantToRemoveThisHome),
          cancelLabel: locale.cancel,
          confirmLabel: locale.remove,
        );
      },
    );
  }
}
