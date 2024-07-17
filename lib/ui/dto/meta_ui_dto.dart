import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/meta/meta.dart';

class MetaUiDto {
  final String? _code;
  final String? _title;
  final AppLocalizations _locale;

  final String Function(AppLocalizations) defaultName;

  MetaUiDto(
    this._locale,
    Meta meta, {
    required this.defaultName,
  })  : _code = meta.code,
        _title = meta.title;

  String get code => _code ?? _locale.code;

  String get title => _title ?? _locale.title;

  String get name {
    if (_title != null) {
      return _title!;
    }
    if (_code != null) {
      return _code!;
    }
    return defaultName(_locale);
  }

  String get fullName {
    if (_title != null && _code != null) {
      return '$_title / $_code';
    }
    return name;
  }
}
