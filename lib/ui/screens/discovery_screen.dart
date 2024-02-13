import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_list.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class DiscoveryScreen {
  static Widget build(_) => TitleScreen(
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
