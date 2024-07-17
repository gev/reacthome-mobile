import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/ui/dto/meta_ui_dto.dart';

class HomeUI {
  final MetaUI meta;
  final bool hasProject;
  final String? address;

  HomeUI(
    AppLocalizations locale, {
    Home? home,
  })  : meta = MetaUI(
          locale,
          home?.meta ?? const Meta(),
          defaultName: (context) => locale.unknownHome,
        ),
        hasProject = home?.project != null,
        address = home?.address?.address;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeUI &&
          runtimeType == other.runtimeType &&
          meta == other.meta &&
          hasProject == other.hasProject;

  @override
  int get hashCode => Object.hash(meta, hasProject);
}
