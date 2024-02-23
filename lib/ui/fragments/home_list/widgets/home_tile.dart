import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class HomeTile extends StatelessWidget {
  final String id;
  const HomeTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoveryHomeViewModel>();
    String title = context.select<DiscoveryHomeViewModel, String>(
      (model) => model.getHomeTitle(id),
    );
    bool hasProject = context.select<DiscoveryHomeViewModel, bool>(
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
      onTap: () => model.onHomeTileTap(
        id,
        DiscoveryHomeAddConfirm(id),
        const DiscoveryHomeAddAlert(),
      ),
    );
  }
}
