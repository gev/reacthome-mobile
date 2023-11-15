import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view.android.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view.ios.dart';
import 'package:reacthome/util/platform.dart';

Widget listTile({
  ValueKey? key,
  required String title,
  Widget? trailing,
}) =>
    selectPlatform(
      ios: () => ListTileIOS(title, trailing: trailing, key: key),
      android: () => ListTileAndroid(title, trailing: trailing, key: key),
    );
