import 'package:reacthome/ui/widgets/add_button/add_button_cupertino.dart';
import 'package:reacthome/ui/widgets/add_button/add_button_material.dart';
import 'package:reacthome/util/platform.dart';

class AddButton extends PlatformWidget {
  AddButton({
    void Function()? onPressed,
    super.key,
  }) : super(
          cupertino: AddButtonCupertino.build(onPressed),
          material: AddButtonMaterial.build(onPressed),
        );
}
