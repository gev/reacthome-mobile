import 'package:flutter/material.dart';
import 'package:reacthome/ui/screens/home/home_screen_add_button_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view.dart';
import 'package:reacthome/ui/screens/home/home_screen_number_title_view.dart';

class HomeScreenViewAndroid extends StatelessWidget {
  final String title;
  const HomeScreenViewAndroid({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const NumberTitle(),
          title: Text(title),
          actions: const [AddDaemonButton()],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [DaemonsList()],
          ),
        ),
      );
}
