import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/add_button/add_button_cupertino.dart';
import 'package:reacthome/ui/widgets/add_button/add_button_material.dart';
import 'package:reacthome/util/platform.dart';

class AddButton {
  static Widget make({void Function()? onPressed}) => selectPlatform(
        cupertino: () => AddButtonCupertino(onPressed),
        material: () => AddButtonMaterial(onPressed),
      );
}
