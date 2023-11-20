import 'package:flutter/widgets.dart';
import 'package:reacthome/app/ui/screen/home_screen.dart';

class UI {
  static final instance = UI._();

  late final Widget homeScreen;

  UI._() {
    homeScreen = createHomeScreen();
  }
}
