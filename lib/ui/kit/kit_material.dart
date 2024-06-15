// lib/ui/kit/kit_material.dart
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
import 'package:reacthome/ui/widgets/dialog/show/show_dialog_material.dart';
import 'package:reacthome/ui/widgets/divider/divider_material.dart';
import 'package:reacthome/ui/widgets/icon.dart';
import 'package:reacthome/ui/widgets/indicator/activity/indicator_activity_material.dart';
import 'package:reacthome/ui/widgets/indicator/indicator.dart';
import 'package:reacthome/ui/widgets/list/chevron/list_chevron_material.dart';
import 'package:reacthome/ui/widgets/list/list.dart';
import 'package:reacthome/ui/widgets/list/section/list_section_material.dart';
import 'package:reacthome/ui/widgets/list/tile/list_tile_material.dart';
import 'package:reacthome/ui/widgets/scaffold/scaffold_material.dart';
import 'package:reacthome/ui/widgets/switcher/switcher_material.dart';
import 'package:reacthome/ui/widgets/text/field/text_field_material.dart';
import 'package:reacthome/ui/widgets/text/text.dart';
import 'package:reacthome/ui/widgets/theme/theme.dart';
import 'package:reacthome/ui/widgets/theme/theme_material.dart';
import 'package:reacthome/ui/widgets/widget.dart';

const material = WidgetContainer(
  app: AppContainer(
    root: AppRootMaterial.make,
    bar: (
      fixed: AppBarFixedMaterial.make,
      sliver: AppBarSliverMaterial.make,
    ),
  ),
  button: ButtonContainer(
    filled: ButtonFilledMaterial.make,
    icon: (filled: ButtonIconFilledMaterial.make),
  ),
  dialog: DialogContainer(
    show: showDialogMaterial,
    alert: AlertDialogMaterial.make,
    action: DialogActionMaterial.make,
  ),
  divider: DividerMaterial.make,
  icon: IconContainer(
    add: Icons.add,
    wifi: Icons.wifi,
    search: Icons.search,
    settings: Icons.settings,
    home: (
      filled: Icons.home,
      outlined: Icons.home_outlined,
    ),
  ),
  indicator: IndicatorContainer(
    activity: IndicatorActivityMaterial.make,
  ),
  list: ListContainer(
    section: ListSectionMaterial.make,
    tile: ListTileMaterial.make,
    chevron: ListChevronMaterial.make,
  ),
  scaffold: ScaffoldMaterial.make,
  switcher: SwitcherMaterial.make,
  text: TextContainer(
    field: TextFieldMaterial.make,
  ),
  theme: ThemeContainer(
    largeTitle: largeTitleMaterial,
  ),
);
