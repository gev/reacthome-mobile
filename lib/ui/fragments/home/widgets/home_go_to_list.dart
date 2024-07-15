import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui_kit/kit.dart';

class HomeGoToList extends StatelessWidget {
  const HomeGoToList({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.myHomes),
          trailing: list.chevron(),
          onTap: () => Navigator.of(context).pushNamed(
            NavigationRouteNames.homeList,
          ),
        ),
      ],
    );
  }
}
