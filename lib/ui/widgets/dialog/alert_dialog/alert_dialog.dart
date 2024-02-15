import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/dialog/alert_dialog/alert_dialog_cupertino.dart';
import 'package:reacthome/ui/widgets/dialog/alert_dialog/alert_dialog_material.dart';
import 'package:reacthome/util/platform.dart';

class AlertDialog extends PlatformWidget {
  AlertDialog({
    Widget? title,
    Widget? content,
    List<Widget> actions = const [],
    super.key,
  }) : super(
          cupertino: AlertDialogCupertino.build(title, content, actions),
          material: AlertDialogMaterial.build(title, content, actions),
        );
}
