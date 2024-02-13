import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_list.dart';
import 'package:reacthome/ui/widgets/app_bar/app_bar.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';

class DiscoveryScreen {
  static Widget build(BuildContext context) => Scaffold(
        appBar: AppBar.build(
          title: 'Discovery',
        ),
        body: const Expanded(
          child: Column(
            children: [
              DaemonList(),
            ],
          ),
        ),
      );
}
