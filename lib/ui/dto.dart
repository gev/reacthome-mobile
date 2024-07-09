import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';

class MetaUI {
  final String? _code;
  final String? _title;
  final AppLocalizations _locale;

  final String Function(AppLocalizations) defaultName;

  MetaUI(
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaUI &&
          runtimeType == other.runtimeType &&
          _code == other._code &&
          _title == other._title;

  @override
  int get hashCode => Object.hash(_code, _title);
}

class HomeUI {
  final MetaUI meta;
  final bool hasProject;
  final String? address;

  HomeUI(
    AppLocalizations locale, {
    Home? home,
  })  : meta = MetaUI(
          locale,
          home?.meta ?? Meta(),
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
