import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeAdd extends StatelessWidget {
  const DiscoveryHomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        DiscoveryScreenFactory.instance.makeDiscoveryHomeViewModel(context);
    final locale = AppLocalizations.of(context)!;
    return list.tile(
      title: Text(locale.addTheHomeID),
      leading: Icon(icon.add),
      trailing: list.chevron(),
      onTap: viewModel.addHomeButtonPressed,
    );
  }
}
