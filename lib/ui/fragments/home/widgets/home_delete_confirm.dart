import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class HomeAddConfirm extends StatelessWidget {
  final String id;
  const HomeAddConfirm(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final title = context.select<HomeViewModel, String>(
      (model) => model.getHomeTitle(id),
    );
    return confirm(
      context,
      title: Text(locale.doYouWantToAddThisHome),
      content: Text(title),
      cancelLabel: locale.cancel,
      confirmLabel: locale.add,
    );
  }
}
