import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_go_to_add.dart';
import 'package:reacthome/ui/fragments/home/widgets/home_list.dart';
import 'package:reacthome/ui/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui_kit/layouts/fixed_width_layout.dart';

class HomeListScreen extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final HomeListViewModel homeListViewModel;

  const HomeListScreen({
    required this.homeViewModel,
    required this.homeListViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FixedWidthLayout(
      title: locale.myHomes,
      body: Column(
        children: [
          HomeList(
            homeViewModel,
            homeListViewModel,
          ),
          const HomeGoToAdd(),
        ],
      ),
    );
  }
}
