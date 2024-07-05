import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeTile extends StatelessWidget {
  final String id;
  const DiscoveryHomeTile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<DiscoveryHomeViewModel>();

    return StreamBuilder(
      stream: viewModel.stream(id),
      initialData: viewModel.home(id),
      builder: (context, snapshot) {
        final home = snapshot.data!;
        return list.tile(
          title: Text(home.meta.title),
          subtitle: Text(
            id,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading:
              Icon(home.hasProject ? icon.home.filled : icon.home.outlined),
          onTap: () => viewModel.onHomeTileTap(
            id,
            DiscoveryHomeAddConfirm(id),
            const DiscoveryHomeAddAlert(),
          ),
        );
      },
    );
  }
}
