import 'package:reacthome/ui/widgets/switch/switch_cupertino.dart';
import 'package:reacthome/ui/widgets/switch/switch_material.dart';
import 'package:reacthome/util/platform.dart';

class Switch extends PlatformWidget {
  Switch({required bool value, Function(bool)? onChanged, super.key})
      : super(
          cupertino: SwitchCupertino.build(value, onChanged),
          material: SwitchMaterial.build(value, onChanged),
        );
}
