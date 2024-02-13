import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold_cupertino.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold_material.dart';
import 'package:reacthome/util/platform.dart';

class Scaffold extends PlatformWidget {
  Scaffold({
    PreferredSizeWidget? appBar,
    required Widget body,
    super.key,
  }) : super(
          cupertino: ScaffoldCupertino.build(appBar, body),
          material: ScaffoldMaterial.build(appBar, body),
        );
}
