import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui_kit/layouts/fixed_width_layout.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/ui/fragments/connection/widgets/connections.dart';
import 'package:reacthome/ui/fragments/home/view_models/home_view_model.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_go_to_list.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_remove.dart';
import 'package:reacthome/ui/fragments/meta/widgets/meta_props.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final ConnectionViewModel connectionViewModel;

  const HomeScreen({
    required this.homeViewModel,
    required this.connectionViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ({String id});
    return StreamBuilder(
      stream: homeViewModel.stream(arguments.id, locale),
      initialData: homeViewModel.getHome(arguments.id, locale),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return FixedWidthLayout(
          title: home.meta.name,
          body: Column(
            children: [
              MetaProps(arguments.id, home.meta),
              Connections(
                arguments.id,
                home.address,
                connectionViewModel,
              ),
              HomeRemove(arguments.id, homeViewModel),
              const HomeGoToList(),
            ],
          ),
        );
      },
    );
  }
}
