import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view_model.dart';

class DaemonTileIOS extends StatelessWidget {
  final String id;
  const DaemonTileIOS({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    String title = context.select<HomeScreenDaemonTileViewModel, String>(
        (model) => model.getDaemonTitleById(id));
    return CupertinoListTile(
      title: Text(title),
    );
  }
}
