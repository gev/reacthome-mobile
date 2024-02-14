import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:reacthome/util/platform.dart';

class Icons {
  static final IconData add = selectPlatform(
    cupertino: CupertinoIcons.add,
    material: material.Icons.add,
  );
}
