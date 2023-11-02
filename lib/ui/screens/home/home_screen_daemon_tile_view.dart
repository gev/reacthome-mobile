import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view.android.dart';
import 'package:reacthome/ui/screens/home/home_screen_daemon_tile_view.ios%20copy.dart';
import 'package:reacthome/util/platform.dart';

Widget daemonTile({
  ValueKey? key,
  required String id,
}) =>
    selectPlatform(
      ios: DaemonTileIOS(key: key, id: id),
      android: DaemonTileAndroid(key: key, id: id),
    );
