import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/util/service_locator.dart';

class DiscoveryHomeAdd extends StatelessWidget {
  const DiscoveryHomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = $.get<DiscoveryHomeViewModel>(context);
    final locale = AppLocalizations.of(context)!;
    return list.tile(
      title: Text(locale.addTheHomeID),
      leading: Icon(icon.add),
      trailing: list.chevron(),
      onTap: viewModel.addHomeButtonPressed,
    );
  }
}
