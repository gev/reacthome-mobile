import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_list_view_model.dart';

class NumberTitle extends StatelessWidget {
  const NumberTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final numberTitle = context.select<HomeScreenDaemonListViewModel, String>(
        (model) => model.numberTitle);
    return Text(numberTitle);
  }
}
