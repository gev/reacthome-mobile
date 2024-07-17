import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/view_models/discovery_view_model.dart';
import 'package:reacthome/ui/view_models/home_list_view_model.dart';
import 'package:reacthome/ui/view_models/home_view_model.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui_kit/layouts/fixed_width_layout.dart';

class DiscoveryScreen extends StatelessWidget {
  final DiscoveryViewModel discoveryViewModel;
  final HomeListViewModel homeListViewModel;
  final HomeViewModel homeViewModel;

  const DiscoveryScreen({
    required this.discoveryViewModel,
    required this.homeListViewModel,
    required this.homeViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FixedWidthLayout(
      title: locale.addAHome,
      body: Column(
        children: [
          list.section(
            context,
            children: [
              DiscoveryHomeAdd(homeViewModel),
              DiscoveryStatus(discoveryViewModel),
            ],
          ),
          DiscoveryHomeList(
            discoveryViewModel,
            homeListViewModel,
            homeViewModel,
          ),
        ],
      ),
    );
  }
}
