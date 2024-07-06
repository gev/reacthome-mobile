import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_list_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/layouts/fixed_width_layout.dart';

class DiscoveryScreen extends StatelessWidget {
  final DiscoveryStatusViewModel statusViewModel;
  final DiscoveryHomeViewModel homeViewModel;
  final DiscoveryHomeListViewModel homeListViewModel;

  const DiscoveryScreen({
    required this.statusViewModel,
    required this.homeViewModel,
    required this.homeListViewModel,
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
              DiscoveryStatus(statusViewModel),
            ],
          ),
          DiscoveryHomeList(
            homeViewModel: homeViewModel,
            homeListViewModel: homeListViewModel,
            title: locale.discovered,
          ),
        ],
      ),
    );
  }
}
