import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class DiscoveryHomeAddConfirm extends StatelessWidget {
  final String id;
  final DiscoveryHomeViewModel viewModel;

  const DiscoveryHomeAddConfirm(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return StreamBuilder(
        stream: viewModel.stream(id, locale),
        initialData: viewModel.home(id, locale),
        builder: (context, snapshot) {
          final home = snapshot.data!;
          return confirm(
            context,
            title: Text(locale.doYouWantToAddThisHome),
            content: Text(home.meta.fullName),
            cancelLabel: locale.cancel,
            confirmLabel: locale.add,
          );
        });
  }
}
