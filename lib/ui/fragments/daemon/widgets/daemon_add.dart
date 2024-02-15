import 'package:flutter/widgets.dart';
import 'package:reacthome/ui/icons/icons.dart';
import 'package:reacthome/ui/widgets/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile.dart';
import 'package:reacthome/ui/widgets/list_tile_chevron/list_tile_chevron.dart';

class DaemonAdd extends StatelessWidget {
  const DaemonAdd({super.key});

  @override
  Widget build(BuildContext context) => ListSection(
        children: [
          ListTile(
            title: 'Add by ID',
            leading: Icon(Icons.add),
            trailing: ListTileChevron(),
          ),
        ],
      );
}
