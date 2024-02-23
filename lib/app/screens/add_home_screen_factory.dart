import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/add_home_screen.dart';

class AddHomeScreenFactory {
  static final instance = AddHomeScreenFactory._();

  AddHomeScreenFactory._();

  Widget make(BuildContext context) => AddHomeScreen.build(context);
}
