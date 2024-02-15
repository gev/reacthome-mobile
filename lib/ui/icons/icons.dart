import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:reacthome/util/platform.dart';

class Icons {
  static final IconData add = selectPlatform(
    cupertino: CupertinoIcons.add,
    material: material.Icons.add,
  );

  static final IconData wifi = selectPlatform(
    cupertino: CupertinoIcons.wifi,
    material: material.Icons.wifi,
  );

  static final IconData search = selectPlatform(
    cupertino: CupertinoIcons.search,
    material: material.Icons.search,
  );

  static final IconData settings = selectPlatform(
    cupertino: CupertinoIcons.settings,
    material: material.Icons.settings,
  );

  static final IconData home = selectPlatform(
    cupertino: CupertinoIcons.home,
    material: material.Icons.home_filled,
  );

  static final IconData homeOutlined = selectPlatform(
    cupertino: CupertinoIcons.home,
    material: material.Icons.home_outlined,
  );
}
