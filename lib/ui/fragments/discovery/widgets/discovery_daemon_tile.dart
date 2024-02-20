import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/daemon/view_models/daemon_title_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryDaemonTile extends StatelessWidget {
  final String id;
  const DiscoveryDaemonTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    String? title = context.select<DaemonTitleViewModel, String?>(
      (model) => model.getDaemonTitleById(id),
    );
    bool hasProject = context.select<DaemonTitleViewModel, bool>(
      (model) => model.hasProject(id),
    );
    return list.tile(
      title: Text(title ?? locale.untitled),
      subtitle: Text(
        id,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(hasProject ? icon.home.filled : icon.home.outlined),
    );
  }
}
