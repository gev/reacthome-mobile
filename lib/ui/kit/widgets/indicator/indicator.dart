import 'package:flutter/widgets.dart';

typedef IndicatorActivityFactory = Widget Function();

class IndicatorContainer {
  final IndicatorActivityFactory activity;

  const IndicatorContainer({required this.activity});
}
