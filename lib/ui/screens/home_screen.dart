import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_go_to_list.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_props.dart';
import 'package:reacthome/ui/fragments/meta/widgets/meta_props.dart';
import 'package:reacthome/ui/layouts/fixed_width_layout.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String id});
    return StreamBuilder(
      stream: viewModel.stream(arguments.id, locale),
      initialData: viewModel.getHome(arguments.id, locale),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return FixedWidthLayout(
          title: home.meta.name,
          body: Column(
            children: [
              MetaProps(arguments.id, home.meta),
              HomeProps(home),
              const HomeGoToList(),
            ],
          ),
        );
      },
    );
  }
}
