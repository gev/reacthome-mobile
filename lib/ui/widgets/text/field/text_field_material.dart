import 'package:flutter/material.dart';

class TextFieldMaterial {
  static Widget make({
    TextEditingController? controller,
    String? placeholder,
    bool autofocus = false,
  }) =>
      TextField(
        controller: controller,
        autofocus: autofocus,
        decoration: InputDecoration(
          hintText: placeholder,
        ),
      );
}
