import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view_model.dart';

class DaemonTileAndroid extends StatelessWidget {
  final String id;
  const DaemonTileAndroid({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    String title = context.select<HomeScreenDaemonTileViewModel, String>(
        (model) => model.getDaemonTitleById(id));
    return ListTile(
      title: Text(title),
    );
  }
}
