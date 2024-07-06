import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeAdd extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeAdd(this.viewModel, {super.key});

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
          onTap: viewModel.addHomeButtonPressed,
        ),
      ],
    );
  }
}
