import 'package:flutter/widgets.dart';

typedef IndicatorActivityFactory = Widget Function();

typedef IndicatorContainer = ({
  IndicatorActivityFactory activity,
});
