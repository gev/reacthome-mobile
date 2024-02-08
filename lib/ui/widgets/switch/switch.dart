import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/switch/switch_cupertino.dart';
import 'package:reacthome/ui/widgets/switch/switch_material.dart';
import 'package:reacthome/util/platform.dart';

class Switch {
  static Widget make({
    required bool value,
    required void Function(bool)? onChanged,
  }) =>
      selectPlatform(
        cupertino: () => SwitchCupertino(value: value, onChanged: onChanged),
        material: () => SwitchMaterial(value: value, onChanged: onChanged),
      );
}
