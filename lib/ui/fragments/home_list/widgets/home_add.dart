import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/home_list/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeAdd extends StatelessWidget {
  const HomeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeViewModel>();
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(locale.addTheHomeID),
          leading: Icon(icon.add),
          trailing: list.chevron(),
          onTap: model.addHomeButtonPressed,
        ),
      ],
    );
  }
}
