import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.ios.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view.dart';
import 'package:reacthome/ui/screens/home/home_screen_number_title_view.dart';

class HomeScreenViewIOS extends StatelessWidget {
  final String title;
  const HomeScreenViewIOS({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: const NumberTitle(),
          middle: Text(title),
          trailing: const AddDaemonButton()),
      child: const DaemonsList(),
    );
  }
}
