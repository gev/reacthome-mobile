import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_daemon_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_daemon_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_daemon_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryDaemonTile extends StatelessWidget {
  final String id;
  const DiscoveryDaemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoveryDaemonViewModel>();
    String title = context.select<DiscoveryDaemonViewModel, String>(
      (model) => model.getDaemonTitle(id),
    );
    bool hasProject = context.select<DiscoveryDaemonViewModel, bool>(
      (model) => model.hasProject(id),
    );
    return list.tile(
      title: Text(title),
      subtitle: Text(
        id,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(hasProject ? icon.home.filled : icon.home.outlined),
      onTap: () => model.onDaemonTileTap(
        id,
        DiscoveryDaemonConfirm(id),
        const DiscoveryDaemonAlert(),
      ),
    );
  }
}
