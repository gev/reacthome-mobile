import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/screens/home_screen_factory.dart';
import 'package:reacthome/ui/widgets/confirm.dart';

class HomeAddConfirm extends StatelessWidget {
  final String id;
  const HomeAddConfirm(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final viewModel = HomeScreenFactory.instance.makeHomeViewModel(context);
    return StreamBuilder(
      stream: viewModel.stream(id),
      initialData: viewModel.getHome(id),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return confirm(
          context,
          title: Text(locale.doYouWantToAddThisHome),
          content: Text(home.meta.name),
          cancelLabel: locale.cancel,
          confirmLabel: locale.add,
        );
      },
    );
  }
}
