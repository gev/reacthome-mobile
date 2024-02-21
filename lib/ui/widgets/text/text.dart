import 'package:flutter/widgets.dart';

typedef TextFieldFactory = Widget Function({
  TextEditingController? controller,
});

typedef TextContainer = ({
  TextFieldFactory field,
});
