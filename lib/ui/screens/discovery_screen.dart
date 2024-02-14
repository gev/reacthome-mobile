import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_list.dart';
import 'package:reacthome/ui/widgets/activity_indicator/activity_indicator.dart';
import 'package:reacthome/ui/widgets/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/widgets/sliver_app_bar%20/sliver_app_bar.dart';
import 'package:reacthome/ui/widgets/switch/switch.dart';

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
                  ListSection(children: [
                    ListTile(
                      title: 'Discovery around',
                      trailing: Switch(value: true, onChanged: (_) {}),
                    ),
                  ]),
                  const DaemonList(title: 'Available around'),
                  Expanded(
                    child: ListSection(
                      children: [
                        ListTile(
                            title: 'Add by ID', trailing: ActivityIndicator()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
