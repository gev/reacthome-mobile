import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/button/icon_filled_button/icon_filled_button_cupertino.dart';
import 'package:reacthome/ui/widgets/button/icon_filled_button/icon_filled_button_material.dart';
import 'package:reacthome/util/platform.dart';

class IconFilledButton extends PlatformWidget {
  IconFilledButton({
    required String label,
    required IconData icon,
    void Function()? onPressed,
    super.key,
  }) : super(
          cupertino: IconFilledButtonCupertino.build(label, icon, onPressed),
          material: IconFilledButtonMaterial.build(label, icon, onPressed),
        );
}
