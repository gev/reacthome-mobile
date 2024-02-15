import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/icons/icons.dart';
import 'package:reacthome/ui/widgets/list/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list/list_tile/list_tile.dart';
import 'package:reacthome/ui/widgets/list/list_tile_chevron/list_tile_chevron.dart';

class DaemonAdd extends StatelessWidget {
  const DaemonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return ListSection(
      children: [
        ListTile(
          title: Text(locale.addYorOwnHome),
          leading: Icon(Icons.add),
          trailing: ListTileChevron(),
        ),
      ],
    );
  }
}
