import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/layouts/full_width_layout.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return FullWidthLayout(
      title: locale.addAHome,
      body: Column(
        children: [
          list.section(
            context,
            children: [
              const DiscoveryHomeAdd(),
              const DiscoveryStatus(),
            ],
          ),
          DiscoveryHomeList(
            title: locale.discovered,
          ),
        ],
      ),
    );
  }
}
