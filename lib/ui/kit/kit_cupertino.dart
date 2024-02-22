import 'package:flutter/cupertino.dart';
import 'package:reacthome/ui/widgets/app/app.dart';
import 'package:reacthome/ui/widgets/app/bar/fixed/app_bar_fixed_cupertino.dart';
import 'package:reacthome/ui/widgets/app/bar/sliver/app_bar_sliver_cupertino.dart';
import 'package:reacthome/ui/widgets/app/root/app_root_cupertino.dart';
import 'package:reacthome/ui/widgets/button/button.dart';
import 'package:reacthome/ui/widgets/button/filled/button_filled_cupertino.dart';
import 'package:reacthome/ui/widgets/button/icon/filled/button_icon_filled_cupertino.dart';
import 'package:reacthome/ui/widgets/dialog/action/dialog_action_cupertino.dart';
import 'package:reacthome/ui/widgets/dialog/alert/dialog_alert_cupertino.dart';
import 'package:reacthome/ui/widgets/dialog/dialog.dart';
import 'package:reacthome/ui/widgets/dialog/show/show_dialog_cupertino.dart';
import 'package:reacthome/ui/widgets/divider/divider.dart';
import 'package:reacthome/ui/widgets/divider/divider_cupertino.dart';
import 'package:reacthome/ui/widgets/icon.dart';
import 'package:reacthome/ui/widgets/indicator/activity/indicator_activity_cupertino.dart';
import 'package:reacthome/ui/widgets/indicator/indicator.dart';
import 'package:reacthome/ui/widgets/list/chevron/list_chevron_cupertino.dart';
import 'package:reacthome/ui/widgets/list/list.dart';
import 'package:reacthome/ui/widgets/list/section/list_section_cupertino.dart';
import 'package:reacthome/ui/widgets/list/tile/list_tile_cupertino.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold_cupertino.dart';
import 'package:reacthome/ui/widgets/switcher/switcher.dart';
import 'package:reacthome/ui/widgets/switcher/switcher_cupertino.dart';
import 'package:reacthome/ui/widgets/text/field/text_field_cupertino.dart';
import 'package:reacthome/ui/widgets/text/text.dart';
import 'package:reacthome/ui/widgets/widget.dart';

const AppContainer _app = (
  root: AppRootCupertino.make,
  bar: (
    fixed: AppBarCupertino.make,
    sliver: AppBarSliverCupertino.make,
  ),
);

const ButtonContainer _button = (
  filled: ButtonFilledCupertino.make,
  icon: (filled: ButtonIconFilledCupertino.make),
);

const DialogContainer _dialog = (
  show: showDialogCupertino,
  alert: AlertDialogCupertino.make,
  action: DialogActionCupertino.make,
);

const DividerFactory _divider = DividerCupertino.make;

const IndicatorContainer _indicator =
    (activity: IndicatorActivityCupertino.make,);

const ListContainer _list = (
  section: ListSectionCupertino.make,
  tile: ListTileCupertino.make,
  chevron: ListChevronCupertino.make,
);

const ScaffoldFactory _scaffold = ScaffoldCupertino.make;

const SwitcherFactory _switcher = SwitcherCupertino.make;

const TextContainer _text = (field: TextFieldCupertino.make);

const IconContainer _icon = (
  add: CupertinoIcons.add,
  wifi: CupertinoIcons.wifi,
  search: CupertinoIcons.search,
  settings: CupertinoIcons.settings,
  home: (
    filled: CupertinoIcons.house_fill,
    outlined: CupertinoIcons.house,
  )
);

const WidgetContainer cupertino = (
  app: _app,
  button: _button,
  dialog: _dialog,
  divider: _divider,
  icon: _icon,
  indicator: _indicator,
  list: _list,
  scaffold: _scaffold,
  switcher: _switcher,
  text: _text,
);
