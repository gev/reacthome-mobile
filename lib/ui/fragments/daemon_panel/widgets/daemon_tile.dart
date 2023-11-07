import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/widgets/list_tile/home_screen_daemon_tile_view.dart';

class DaemonTile extends StatelessWidget {
  final String id;
  const DaemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    String title = context.select<DaemonTitleViewModel, String>(
        (model) => model.getDaemonTitleById(id));
    return listTile(title: title);
  }
}
