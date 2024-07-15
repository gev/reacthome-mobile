import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui_kit/kit.dart';
import 'package:reacthome/ui/dto.dart';

class MetaProps extends StatelessWidget {
  final String id;
  final MetaUI meta;

  const MetaProps(this.id, this.meta, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.section(
      context,
      children: [
        list.tile(
          title: Text(id),
        ),
        list.tile(
          title: Text(meta.title),
          trailing: Text(locale.title),
        ),
        list.tile(
          title: Text(meta.code),
          trailing: Text(locale.code),
        ),
      ],
    );
  }
}
