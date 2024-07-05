import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeAdd extends StatelessWidget {
  const HomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final model = HomeScreenFactory.instance.makeHomeViewModel(context);
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.addAHome),
          leading: Icon(icon.add),
          trailing: list.chevron(),
          onTap: model.addHomeButtonPressed,
        ),
      ],
    );
  }
}
