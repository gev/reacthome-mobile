import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui/app/navigation.dart';

class HomeGoToAdd extends StatelessWidget {
  const HomeGoToAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.addAHome),
          leading: Icon(icon.add),
          trailing: list.chevron(),
          onTap: () => Navigator.of(context).pushNamed(
            NavigationRouteNames.discovery,
          ),
        ),
      ],
    );
  }
}
