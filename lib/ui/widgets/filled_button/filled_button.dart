import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/filled_button/filled_button_cupertino.dart';
import 'package:reacthome/ui/widgets/filled_button/filled_button_material.dart';
import 'package:reacthome/util/platform.dart';

class FilledButton {
  static Widget make({required String label, void Function()? onPressed}) =>
      selectPlatform(
        cupertino: () => FilledButtonCupertino(label, onPressed),
        material: () => FilledButtonMaterial(label, onPressed),
      );
}
