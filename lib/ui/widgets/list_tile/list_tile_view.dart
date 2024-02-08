import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view_cupertino.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view_material.dart';
import 'package:reacthome/util/platform.dart';

class ListTile {
  static Widget make({
    ValueKey? key,
    required String title,
    Widget? trailing,
  }) =>
      selectPlatform(
        cupertino: () => ListTileCupertino(title, trailing: trailing, key: key),
        material: () => ListTileMaterial(title, trailing: trailing, key: key),
      );
}
