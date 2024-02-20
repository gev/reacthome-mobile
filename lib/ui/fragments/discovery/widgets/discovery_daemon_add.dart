import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryDaemonAdd extends StatelessWidget {
  const DiscoveryDaemonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.addYorOwnHome),
          leading: Icon(icon.add),
          trailing: list.chevron(),
        ),
      ],
    );
  }
}
