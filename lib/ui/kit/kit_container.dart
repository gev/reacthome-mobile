import 'package:reacthome/ui/kit/theme/theme.dart';
import 'package:reacthome/ui/kit/widgets/app/app.dart';
import 'package:reacthome/ui/kit/widgets/button/button.dart';
import 'package:reacthome/ui/kit/widgets/dialog/dialog.dart';
import 'package:reacthome/ui/kit/widgets/divider/divider.dart';
import 'package:reacthome/ui/kit/widgets/icon.dart';
import 'package:reacthome/ui/kit/widgets/indicator/indicator.dart';
import 'package:reacthome/ui/kit/widgets/list/list.dart';
import 'package:reacthome/ui/kit/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/kit/widgets/switcher/switcher.dart';
import 'package:reacthome/ui/kit/widgets/text/text.dart';

class KitContainer {
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
  final ThemeContainer theme;

  const KitContainer({
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
    required this.theme,
  });
}
