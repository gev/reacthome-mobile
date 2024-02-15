import 'package:reacthome/ui/widgets/button/filled_button/filled_button_cupertino.dart';
import 'package:reacthome/ui/widgets/button/filled_button/filled_button_material.dart';
import 'package:reacthome/util/platform.dart';

class FilledButton extends PlatformWidget {
  FilledButton({
    required String label,
    void Function()? onPressed,
    super.key,
  }) : super(
          cupertino: FilledButtonCupertino.build(label, onPressed),
          material: FilledButtonMaterial.build(label, onPressed),
        );
}
