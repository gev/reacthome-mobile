import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

Widget confirm(
  BuildContext context, {
  Widget? title,
  Widget? content,
  required String confirmLabel,
  required String cancelLabel,
}) =>
    dialog.alert(
      title: title,
      content: content,
      actions: [
        dialog.action(
          label: cancelLabel,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        dialog.action(
          label: confirmLabel,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
