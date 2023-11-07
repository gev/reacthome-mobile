import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon_panel/add_daemon_button_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/daemon_list_view.dart';
import 'package:reacthome/ui/fragments/daemon_panel/number_title_view.dart';

class DaemonPanel extends StatelessWidget {
  const DaemonPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          DaemonList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberTitle(),
              AddDaemonButton(),
            ],
          ),
        ],
      ),
    );
  }
}
