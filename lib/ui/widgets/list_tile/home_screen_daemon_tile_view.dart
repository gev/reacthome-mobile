import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_tile/home_screen_daemon_tile_view.android.dart';
import 'package:reacthome/ui/widgets/list_tile/home_screen_daemon_tile_view.ios.dart';
import 'package:reacthome/util/platform.dart';

Widget listTile({
  ValueKey? key,
  required String title,
}) =>
    selectPlatform(
      ios: ListTileIOS(title, key: key),
      android: ListTileAndroid(title, key: key),
    );
