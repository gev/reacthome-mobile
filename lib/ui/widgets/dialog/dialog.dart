import 'package:flutter/widgets.dart';

typedef DialogActionFactory = Widget Function({
  required String label,
  bool isDefaultAction,
  bool isDestructiveAction,
  void Function()? onPressed,
});

typedef DialogAlertFactory = void Function(
  BuildContext builder, {
  Widget? title,
  Widget? content,
  required List<Widget> actions,
});

typedef DialogContainer = ({
  DialogAlertFactory showDialog,
  DialogActionFactory action,
});
