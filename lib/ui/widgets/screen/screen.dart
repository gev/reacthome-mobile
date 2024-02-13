import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/screen/screen_cupertino.dart';
import 'package:reacthome/ui/widgets/screen/screen_material.dart';
import 'package:reacthome/util/platform.dart';

class Screen extends PlatformWidget {
  Screen({required Widget body, super.key})
      : super(
          cupertino: ScreenCupertino.build(body),
          material: ScreenMaterial.build(body),
        );
}

class TitleScreen extends PlatformWidget {
  TitleScreen({
    required String title,
    required Widget body,
    Widget? trailing,
    super.key,
  }) : super(
          cupertino: TitleScreenCupertino.build(title, body, trailing),
          material: TitleScreenMaterial.build(title, body, trailing),
        );
}
