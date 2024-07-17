import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/ui/dto/meta_ui_dto.dart';

class HomeUiDto {
  final MetaUiDto meta;
  final bool hasProject;
  final String? address;

  HomeUiDto(
    AppLocalizations locale, {
    Home? home,
  })  : meta = MetaUiDto(
          locale,
          home?.meta ?? const Meta(),
          defaultName: (context) => locale.unknownHome,
        ),
        hasProject = home?.project != null,
        address = home?.address?.address;
}
