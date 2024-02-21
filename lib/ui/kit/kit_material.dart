import 'package:flutter/material.dart';
import 'package:reacthome/ui/widgets/app/app.dart';
import 'package:reacthome/ui/widgets/app/bar/fixed/app_bar_fixed_material.dart';
import 'package:reacthome/ui/widgets/app/bar/sliver/app_bar_sliver_material.dart';
import 'package:reacthome/ui/widgets/app/root/app_root_material.dart';
import 'package:reacthome/ui/widgets/button/button.dart';
import 'package:reacthome/ui/widgets/button/filled/button_filled_material.dart';
import 'package:reacthome/ui/widgets/button/icon/filled/button_icon_filled_material.dart';
import 'package:reacthome/ui/widgets/dialog/action/dialog_action_material.dart';
import 'package:reacthome/ui/widgets/dialog/alert/dialog_alert_material.dart';
import 'package:reacthome/ui/widgets/dialog/dialog.dart';
import 'package:reacthome/ui/widgets/divider/divider.dart';
import 'package:reacthome/ui/widgets/divider/divider_material.dart';
import 'package:reacthome/ui/widgets/icon.dart';
import 'package:reacthome/ui/widgets/indicator/activity/indicator_activity_material.dart';
import 'package:reacthome/ui/widgets/indicator/indicator.dart';
import 'package:reacthome/ui/widgets/list/chevron/list_chevron_material.dart';
import 'package:reacthome/ui/widgets/list/list.dart';
import 'package:reacthome/ui/widgets/list/section/list_section_material.dart';
import 'package:reacthome/ui/widgets/list/tile/list_tile_material.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold_material.dart';
import 'package:reacthome/ui/widgets/switcher/switcher.dart';
import 'package:reacthome/ui/widgets/switcher/switcher_material.dart';
import 'package:reacthome/ui/widgets/text/field/text_field_material.dart';
import 'package:reacthome/ui/widgets/text/text.dart';
import 'package:reacthome/ui/widgets/widget.dart';

const AppContainer _app = (
  root: AppRootMaterial.make,
  bar: (
    fixed: AppBarMaterial.make,
    sliver: AppBarSliverMaterial.make,
  ),
);

const ButtonContainer _button = (
  filled: ButtonFilledMaterial.make,
  icon: (filled: ButtonIconFilledMaterial.make),
);

const DialogContainer _dialog = (
  showDialog: AlertDialogMaterial.make,
  action: DialogActionMaterial.make,
);

const DividerFactory _divider = DividerMaterial.make;

const IndicatorContainer _indicator =
    (activity: IndicatorActivityMaterial.make,);

const ListContainer _list = (
  section: ListSectionMaterial.make,
  tile: ListTileMaterial.make,
  chevron: ListChevronMaterial.make,
);

const ScaffoldFactory _scaffold = ScaffoldMaterial.make;

const SwitcherFactory _switcher = SwitcherMaterial.make;

const TextContainer _text = (field: TextFieldMaterial.make);

const IconContainer _icon = (
  add: Icons.add,
  wifi: Icons.wifi,
  search: Icons.search,
  settings: Icons.settings,
  home: (
    filled: Icons.home,
    outlined: Icons.home_outlined,
  )
);

const WidgetContainer material = (
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
