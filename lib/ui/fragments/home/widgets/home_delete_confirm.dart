import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class HomeAddConfirm extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const HomeAddConfirm(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return StreamBuilder(
      stream: viewModel.stream(id),
      initialData: viewModel.getHome(id),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return confirm(
          context,
          title: Text(locale.doYouWantToAddThisHome),
          content: Text(home.meta.name),
          cancelLabel: locale.cancel,
          confirmLabel: locale.add,
        );
      },
    );
  }
}
