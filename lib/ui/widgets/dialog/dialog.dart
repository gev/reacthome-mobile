import 'package:flutter/widgets.dart';

typedef DialogActionFactory = Widget Function({
  required String label,
  bool isDefaultAction,
  bool isDestructiveAction,
  void Function()? onPressed,
});

typedef DialogAlertFactory = Widget Function({
  Widget? title,
  Widget? content,
  required List<Widget> actions,
});

typedef ShowDialog = Future<T?> Function<T>(
  BuildContext context, {
  required WidgetBuilder builder,
});

typedef DialogContainer = ({
  ShowDialog show,
  DialogAlertFactory alert,
  DialogActionFactory action,
});
