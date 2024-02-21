import 'package:flutter/cupertino.dart';

class TextFieldCupertino {
  static Widget make({
    TextEditingController? controller,
    String? placeholder,
    bool autofocus = false,
  }) =>
      CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        autofocus: autofocus,
      );
}
