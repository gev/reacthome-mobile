import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/widgets/screen/screen.dart';

class HomeScreen {
  static Widget make({
    String title = 'Home',
    required Widget left,
    required Widget right,
  }) =>
      TitleScreen.make(
          title: title,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [left, right],
          ));
}
