import 'package:flutter/widgets.dart';

class ThemeContainer {
  final TextStyle? Function(BuildContext context) largeTitle;

  const ThemeContainer({required this.largeTitle});
}
