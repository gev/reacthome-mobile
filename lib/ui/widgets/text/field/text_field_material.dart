import 'package:flutter/material.dart';

class TextFieldMaterial {
  static Widget make({
    TextEditingController? controller,
  }) =>
      TextField(
        controller: controller,
      );
}
