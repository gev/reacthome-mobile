import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view.dart';
import 'package:reacthome/ui/screens/home/home_screen_number_title_view.dart';

class DaemonPanel extends StatelessWidget {
  const DaemonPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const DaemonList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const NumberTitle(),
              addButton(),
            ],
          ),
        ],
      ),
    );
  }
}
