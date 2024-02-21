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

typedef WidgetContainer = ({
  AppContainer app,
  ButtonContainer button,
  DialogContainer dialog,
  DividerFactory divider,
  IconContainer icon,
  IndicatorContainer indicator,
  ListContainer list,
  ScaffoldFactory scaffold,
  SwitcherFactory switcher,
  TextContainer text,
});
