import 'package:flutter/cupertino.dart';

Future<T?> showDialogCupertino<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) =>
    showCupertinoDialog(
      context: context,
      builder: builder,
      barrierDismissible: true,
    );
