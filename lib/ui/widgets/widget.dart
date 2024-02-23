import 'package:reacthome/ui/widgets/app/app.dart';
import 'package:reacthome/ui/widgets/button/button.dart';
import 'package:reacthome/ui/widgets/dialog/dialog.dart';
import 'package:reacthome/ui/widgets/divider/divider.dart';
import 'package:reacthome/ui/widgets/icon.dart';
import 'package:reacthome/ui/widgets/indicator/indicator.dart';
import 'package:reacthome/ui/widgets/list/list.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/widgets/switcher/switcher.dart';
import 'package:reacthome/ui/widgets/text/text.dart';

class WidgetContainer {
  final AppContainer app;
  final ButtonContainer button;
  final DialogContainer dialog;
  final DividerFactory divider;
  final IconContainer icon;
  final IndicatorContainer indicator;
  final ListContainer list;
  final ScaffoldFactory scaffold;
  final SwitcherFactory switcher;
  final TextContainer text;

  const WidgetContainer({
    required this.app,
    required this.button,
    required this.dialog,
    required this.divider,
    required this.icon,
    required this.indicator,
    required this.list,
    required this.scaffold,
    required this.switcher,
    required this.text,
  });
}
