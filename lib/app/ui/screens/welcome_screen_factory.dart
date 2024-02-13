import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/welcome_screen.dart';

class WelcomeScreenFactory {
  static final instance = WelcomeScreenFactory._();

  WelcomeScreenFactory._();

  Widget make(BuildContext context) => WelcomeScreen.build(context);
}
