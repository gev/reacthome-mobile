import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class DiscoveryHomeAddConfirm extends StatelessWidget {
  final String id;
  final HomeViewModel viewModel;

  const DiscoveryHomeAddConfirm(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return StreamBuilder(
        stream: viewModel.stream(id, locale),
        initialData: viewModel.getHome(id, locale),
        builder: (context, snapshot) {
          final home = snapshot.data!;
          return confirm(
            context,
            title: Text(home.meta.fullName),
            content: Text(locale.doYouWantToAddThisHome),
            cancelLabel: locale.cancel,
            confirmLabel: locale.add,
          );
        });
  }
}
