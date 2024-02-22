import 'package:flutter/material.dart';

Future<T?> showDialogMaterial<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) =>
    showDialog<T>(
      context: context,
      builder: builder,
    );
