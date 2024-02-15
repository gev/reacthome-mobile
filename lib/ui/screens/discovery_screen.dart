import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_add.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_list.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_status.dart';
import 'package:reacthome/ui/widgets/divider/divider.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/widgets/sliver_app_bar%20/sliver_app_bar.dart';

class DiscoveryScreen {
  static Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(title: 'Add the Home'),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Column(
                children: [
                  const DiscoveryStatus(),
                  DaemonList(
                    title: 'Available around',
                    ifEmpty: Divider(),
                  ),
                  const Expanded(child: DaemonAdd()),
                ],
              ),
            ),
          ],
        ),
      );
}
