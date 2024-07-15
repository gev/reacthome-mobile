import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

typedef IconKind = ({
  IconData filled,
  IconData outlined,
});

class IconContainer {
  final IconData add;
  final IconData delete;
  final IconData search;
  final IconData settings;
  final IconData wifi;
  final IconKind home;

  const IconContainer({
    required this.add,
    required this.delete,
    required this.search,
    required this.settings,
    required this.wifi,
    required this.home,
  });
}
