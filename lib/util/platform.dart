import 'dart:io';

import 'package:flutter/widgets.dart';

T selectPlatform<T>({
  required T cupertino,
  required T material,
}) =>
    Platform.isIOS || Platform.isMacOS ? cupertino : material;

abstract class PlatformWidget extends StatelessWidget {
  final WidgetBuilder buildWidget;

  PlatformWidget({
    required WidgetBuilder cupertino,
    required WidgetBuilder material,
    super.key,
  }) : buildWidget = selectPlatform(cupertino: cupertino, material: material);

  @override
  Widget build(BuildContext context) => buildWidget(context);
}
