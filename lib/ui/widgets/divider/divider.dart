import 'package:reacthome/ui/widgets/divider/divider_cupertino.dart';
import 'package:reacthome/ui/widgets/divider/divider_material.dart';
import 'package:reacthome/util/platform.dart';

class Divider extends PlatformWidget {
  Divider({super.key})
      : super(
          cupertino: DividerCupertino.build(),
          material: DividerMaterial.build(),
        );
}
