import 'package:flutter/widgets.dart';

typedef ButtonFactory = Widget Function({
  required String label,
  Function()? onPressed,
});

typedef ButtonIconFactory = Widget Function({
  required String label,
  required IconData icon,
  Function()? onPressed,
});

typedef ButtonIconKind = ({
  ButtonIconFactory filled,
});

class ButtonContainer {
  final ButtonFactory filled;
  final ButtonIconKind icon;

  const ButtonContainer({
    required this.filled,
    required this.icon,
  });
}
