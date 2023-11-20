import 'package:flutter/widgets.dart';

abstract interface class Factory<T> {
  T create(BuildContext context);
}
