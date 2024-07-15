// lib/ui/kit/kit_cupertino.dart
import 'package:flutter/cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/kit_container.dart';
import 'package:reacthome/infrastructure/ui/kit/layout/layout_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/app/app.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/app/bar/fixed/app_bar_fixed_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/app/bar/sliver/app_bar_sliver_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/app/root/app_root_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/button/button.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/button/filled/button_filled_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/button/icon/filled/button_icon_filled_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/dialog/action/dialog_action_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/dialog/alert/dialog_alert_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/dialog/dialog.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/dialog/show/show_dialog_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/divider/divider_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/icon.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/indicator/activity/indicator_activity_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/indicator/indicator.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/list/chevron/list_chevron_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/list/list.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/list/section/list_section_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/list/tile/list_tile_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/scaffold/scaffold_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/switcher/switcher_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/text/field/text_field_cupertino.dart';
import 'package:reacthome/infrastructure/ui/kit/widgets/text/text.dart';

const cupertino = KitContainer(
  app: AppContainer(
    root: AppRootCupertino.make,
    bar: (
      fixed: AppBarFixedCupertino.make,
      sliver: AppBarSliverCupertino.make,
    ),
  ),
  button: ButtonContainer(
    filled: ButtonFilledCupertino.make,
    icon: (filled: ButtonIconFilledCupertino.make),
  ),
  dialog: DialogContainer(
    show: showDialogCupertino,
    alert: AlertDialogCupertino.make,
    action: DialogActionCupertino.make,
  ),
  divider: DividerCupertino.make,
  icon: IconContainer(
    add: CupertinoIcons.add,
    delete: CupertinoIcons.delete,
    search: CupertinoIcons.search,
    settings: CupertinoIcons.settings,
    wifi: CupertinoIcons.wifi,
    home: (
      filled: CupertinoIcons.house_fill,
      outlined: CupertinoIcons.house,
    ),
  ),
  indicator: IndicatorContainer(
    activity: IndicatorActivityCupertino.make,
  ),
  list: ListContainer(
    section: ListSectionCupertino.make,
    tile: ListTileCupertino.make,
    chevron: ListChevronCupertino.make,
  ),
  scaffold: ScaffoldCupertino.make,
  switcher: SwitcherCupertino.make,
  text: TextContainer(
    field: TextFieldCupertino.make,
  ),
  layout: layout,
);
