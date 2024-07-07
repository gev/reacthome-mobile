import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';

class MetaUI {
  final String? _code;
  final String? _title;
  final BuildContext _context;

  final String Function(BuildContext) defaultName;

  MetaUI(
    this._context,
    Meta meta, {
    required this.defaultName,
  })  : _code = meta.code,
        _title = meta.title;

  String get code => _code ?? AppLocalizations.of(_context)!.code;

  String get title => _title ?? AppLocalizations.of(_context)!.title;

  String get name {
    if (_title != null) {
      return _title!;
    }
    if (_code != null) {
      return _code!;
    }
    return defaultName(_context);
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

  HomeUI(
    BuildContext context, {
    Home? home,
  })  : meta = MetaUI(
          context,
          home?.meta ?? Meta(),
          defaultName: (context) => AppLocalizations.of(context)!.unknownHome,
        ),
        hasProject = home?.project != null;

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
