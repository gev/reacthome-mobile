import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class DiscoveryHomeAddConfirm extends StatelessWidget {
  final String id;
  const DiscoveryHomeAddConfirm(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final viewModel =
        DiscoveryScreenFactory.instance.makeDiscoveryHomeViewModel(context);
    return StreamBuilder(
        stream: viewModel.stream(id),
        initialData: viewModel.home(id),
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
