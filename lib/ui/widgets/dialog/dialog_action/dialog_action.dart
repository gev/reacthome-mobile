import 'package:reacthome/ui/widgets/dialog/dialog_action/dialog_action_cupertino.dart';
import 'package:reacthome/ui/widgets/dialog/dialog_action/dialog_action_material.dart';
import 'package:reacthome/util/platform.dart';

class DialogAction extends PlatformWidget {
  DialogAction({
    required String label,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    void Function()? onPressed,
    super.key,
  }) : super(
          cupertino: DialogActionCupertino.build(
            label,
            isDefaultAction,
            isDestructiveAction,
            onPressed,
          ),
          material: DialogActionMaterial.build(
            label,
            onPressed,
          ),
        );
}
