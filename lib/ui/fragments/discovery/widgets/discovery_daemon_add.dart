import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_daemon_add_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryDaemonAdd extends StatelessWidget {
  const DiscoveryDaemonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoveryDaemonAddViewModel>();
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.addHomeID),
          leading: Icon(icon.add),
          trailing: list.chevron(),
          onTap: model.addDaemonButtonPressed,
        ),
      ],
    );
  }
}
