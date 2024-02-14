import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon/widgets/daemon_list.dart';
import 'package:reacthome/ui/widgets/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile.dart';
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
                  ListSection(children: [
                    ListTile(
                      title: 'Discovery around',
                    ),
                  ]),
                  const DaemonList(title: 'Available around'),
                  Expanded(
                    child: ListSection(
                      children: [
                        ListTile(title: 'Add by ID'),
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
