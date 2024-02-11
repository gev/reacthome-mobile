import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_list.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class DiscoveryScreen {
  static Widget make(BuildContext context) => TitleScreen.make(
        title: 'Discovery',
        body: const Expanded(
          child: Column(
            children: [
              DaemonList(),
            ],
          ),
        ),
      );
}
