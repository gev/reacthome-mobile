import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/add_daemon_button.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_list.dart';
import 'package:reacthome/ui/fragments/daemon_panel/widgets/daemon_count.dart';

class DaemonPanelView extends StatelessWidget {
  const DaemonPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          DaemonList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DaemonCount(),
              AddDaemonButton(),
            ],
          ),
        ],
      ),
    );
  }
}
