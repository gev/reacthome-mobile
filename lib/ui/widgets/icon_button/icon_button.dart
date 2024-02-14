import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/icon_button/icon_button_cupertino.dart';
import 'package:reacthome/ui/widgets/icon_button/icon_button_material.dart';
import 'package:reacthome/util/platform.dart';

class AddButton extends PlatformWidget {
  AddButton({
    required String label,
    required IconData icon,
    void Function()? onPressed,
    super.key,
  }) : super(
          cupertino: AddButtonCupertino.build(label, icon, onPressed),
          material: AddButtonMaterial.build(label, icon, onPressed),
        );
}
