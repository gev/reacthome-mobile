import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/kit/kit.dart';

Widget alert(
  BuildContext context, {
  Widget? title,
  Widget? content,
  required String actionLabel,
}) =>
    dialog.alert(
      title: title,
      content: content,
      actions: [
        dialog.action(
          label: actionLabel,
          onPressed: () => Navigator.pop(context, false),
        ),
      ],
    );
