import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/kit/kit.dart';
import 'package:reacthome/ui/widgets/screen.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Screen(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: locale.addAHome),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(
              children: [
                const DiscoveryStatus(),
                DiscoveryHomeList(
                  title: locale.discovered,
                  ifEmpty: divider(),
                ),
                const Expanded(child: DiscoveryHomeAdd()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
