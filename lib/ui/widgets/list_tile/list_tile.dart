import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_cupertino.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_material.dart';
import 'package:reacthome/util/platform.dart';

class ListTile extends PlatformWidget {
  ListTile({
    required String title,
    Widget? trailing,
    super.key,
  }) : super(
          cupertino: ListTileCupertino.build(title, trailing),
          material: ListTileMaterial.build(title, trailing),
        );
}
