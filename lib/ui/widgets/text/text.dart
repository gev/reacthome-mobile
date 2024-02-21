import 'package:flutter/widgets.dart';

typedef TextFieldFactory = Widget Function({
  TextEditingController? controller,
  String? placeholder,
  bool autofocus,
});

typedef TextContainer = ({
  TextFieldFactory field,
});
