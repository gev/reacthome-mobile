import 'package:flutter/widgets.dart';
import 'package:reacthome/app/screens/discovery_screen_factory.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_home_view_model.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_alert.dart';
import 'package:reacthome/ui/fragments/discovery/widgets/discovery_home_add_confirm.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryHomeTile extends StatelessWidget {
  final String id;
  final DiscoveryHomeViewModel viewModel;

  const DiscoveryHomeTile(this.id, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        DiscoveryScreenFactory.instance.makeDiscoveryHomeViewModel(context);
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
            DiscoveryHomeAddConfirm(id, viewModel),
            const DiscoveryHomeAddAlert(),
          ),
        );
      },
    );
  }
}
