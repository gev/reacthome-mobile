import 'package:flutter/cupertino.dart';

class TextFieldCupertino {
  static Widget make({
    TextEditingController? controller,
  }) =>
      CupertinoTextField(
        controller: controller,
      );
}
