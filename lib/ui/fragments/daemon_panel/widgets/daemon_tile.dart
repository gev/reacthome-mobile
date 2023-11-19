import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/connection/connection_vew_model.dart';
import 'package:reacthome/ui/fragments/daemon_panel/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/widgets/list_tile/list_tile_view.dart';

class DaemonTile extends StatelessWidget {
  final String id;
  const DaemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    String title = context.select<DaemonTitleViewModel, String>(
      (model) => model.getDaemonTitleById(id),
    );

    final model = context.read<ConnectionViewModel>();

    bool isConnected = context.select<ConnectionViewModel, bool>(
      (model) => model.isConnected(id),
    );

    bool isLocalConnected = context.select<ConnectionViewModel, bool>(
      (model) => model.isLocalConnected(id),
    );

    bool isCloudConnected = context.select<ConnectionViewModel, bool>(
      (model) => model.isCloudConnected(id),
    );
    return listTile(
      title: title,
      // trailing: Row(
      //   children: [
      //     switcher(
      //       value: isConnected,
      //       onChanged: model.toggleConnection(id),
      //     ),
      //     switcher(
      //       value: isLocalConnected,
      //       onChanged: model.toggleLocalConnection(id),
      //     ),
      //     switcher(
      //       value: isCloudConnected,
      //       onChanged: model.toggleCloudConnection(id),
      //     )
      //   ],
      // ),
    );
  }
}
