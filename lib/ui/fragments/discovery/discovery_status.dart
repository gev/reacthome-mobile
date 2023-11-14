import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/discovery_status_view_model.dart';
import 'package:reacthome/ui/widgets/discovery/discovery_status.dart';

class DiscoveryStatus extends StatelessWidget {
  const DiscoveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<DiscoveryStatusViewModel>();
    final isDiscovering = context.select<DiscoveryStatusViewModel, bool>(
      (model) => model.isDiscovering,
    );
    return discoveryStatus(
        value: isDiscovering, onChanged: model.toggleDiscovery);
  }
}
