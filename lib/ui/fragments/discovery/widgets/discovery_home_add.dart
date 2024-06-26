import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeAdd extends StatelessWidget {
  const DiscoveryHomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoveryHomeViewModel>();
    final locale = AppLocalizations.of(context)!;
    return list.tile(
      title: Text(locale.addTheHomeID),
      leading: Icon(icon.add),
      trailing: list.chevron(),
      onTap: model.addHomeButtonPressed,
    );
  }
}
