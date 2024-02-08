import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/screen/screen_cupertino.dart';
import 'package:reacthome/ui/widgets/screen/screen_material.dart';
import 'package:reacthome/util/platform.dart';

class Screen {
  static Widget make({required Widget body}) => selectPlatform(
        cupertino: () => ScreenCupertino(body: body),
        material: () => ScreenMaterial(body: body),
      );
}

class TitleScreen {
  static Widget make({
    required String title,
    required Widget body,
    Widget? trailing,
  }) =>
      selectPlatform(
        cupertino: () => TitleScreenCupertino(
          title: title,
          body: body,
          trailing: trailing,
        ),
        material: () => TitleScreenMaterial(
          title: title,
          body: body,
          trailing: trailing,
        ),
      );
}
