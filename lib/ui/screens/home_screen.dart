import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/app/navigation.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/layouts/fixed_width_layout.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String home});
    return StreamBuilder(
        stream: viewModel.stream(arguments.home, locale),
        initialData: viewModel.getHome(arguments.home, locale),
        builder: (context, snapshot) {
          final home = snapshot.data!;
          return FixedWidthLayout(
            title: home.meta.name,
            body: Column(
              children: [
                layout.padding.all(
                  child: button.filled(
                    label: 'List',
                    onPressed: () => Navigator.of(context).pushNamed(
                      NavigationRouteNames.homeList,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
