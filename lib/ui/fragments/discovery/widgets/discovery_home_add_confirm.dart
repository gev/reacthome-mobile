import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/dto.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class DiscoveryHomeAddConfirm extends StatelessWidget {
  final String id;
  const DiscoveryHomeAddConfirm(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final home = context.select<DiscoveryHomeViewModel, HomeUI>(
      (model) => model.getHome(id),
    );
    return confirm(
      context,
      title: Text(locale.doYouWantToAddThisHome),
      content: Text(home.meta.fullName),
      cancelLabel: locale.cancel,
      confirmLabel: locale.add,
    );
  }
}
