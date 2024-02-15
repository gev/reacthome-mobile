import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_cupertino.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_material.dart';
import 'package:reacthome/util/platform.dart';

class ListTile extends PlatformWidget {
  ListTile({
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
    super.key,
  }) : super(
          cupertino: ListTileCupertino.build(
            title,
            subtitle,
            leading,
            trailing,
            onTap,
          ),
          material: ListTileMaterial.build(
            title,
            subtitle,
            leading,
            trailing,
            onTap,
          ),
        );
}
