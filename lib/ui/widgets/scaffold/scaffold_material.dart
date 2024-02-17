import 'package:flutter/material.dart';

class ScaffoldMaterial {
  static Widget make({
    PreferredSizeWidget? appBar,
    required Widget body,
  }) =>
      Scaffold(
        appBar: appBar,
        body: body,
      );
}
