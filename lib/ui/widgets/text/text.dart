import 'package:flutter/widgets.dart';

typedef TextFieldFactory = Widget Function({
  TextEditingController? controller,
  String? placeholder,
  bool autofocus,
});

class TextContainer {
  final TextFieldFactory field;

  const TextContainer({required this.field});
}
