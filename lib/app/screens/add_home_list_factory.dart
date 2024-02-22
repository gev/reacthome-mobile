import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/screens/home_list_screen.dart';

class AddHomeListFactory {
  static final instance = AddHomeListFactory._();

  AddHomeListFactory._();

  Widget make(BuildContext context) => const HomeListScreen();
}
