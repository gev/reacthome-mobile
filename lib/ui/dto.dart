import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/meta.dart';

class MetaUI {
  final Meta _meta;
  final BuildContext context;
  final String Function(BuildContext) defaultName;

  const MetaUI(
    this.context,
    this._meta, {
    required this.defaultName,
  });

  String get code => _meta.code ?? AppLocalizations.of(context)!.code;

  String get title => _meta.title ?? AppLocalizations.of(context)!.title;

  String get name {
    final title = _meta.title;
    if (title != null) {
      return title;
    }
    final code = _meta.code;
    if (code != null) {
      return code;
    }
    return defaultName(context);
  }

  String get fullName {
    final Meta(:title, :code) = _meta;
    if (title != null && code != null) {
      return '$title / $code';
    }
    return name;
  }
}

class HomeUI {
  final Home? home;
  final MetaUI meta;

  HomeUI(
    BuildContext context, {
    required this.home,
  }) : meta = MetaUI(
          context,
          home?.meta ?? Meta(),
          defaultName: (context) => AppLocalizations.of(context)!.unknownHome,
        );

  bool get hasProject => home?.project != null;
}
