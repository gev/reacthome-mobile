import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_add.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryScreen {
  static Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          app.bar.sliver(context, title: locale.addYourHome),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Column(
              children: [
                const DiscoveryStatus(),
                DaemonList(
                  title: locale.discovered,
                  ifEmpty: divider(),
                ),
                const Expanded(child: DaemonAdd()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
