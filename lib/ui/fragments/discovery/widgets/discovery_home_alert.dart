import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/widgets/alert.dart';

class DiscoveryHomeAlert extends StatelessWidget {
  const DiscoveryHomeAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return alert(
      context,
      title: Text(locale.cantAddTheHome),
      actionLabel: locale.close,
    );
  }
}
