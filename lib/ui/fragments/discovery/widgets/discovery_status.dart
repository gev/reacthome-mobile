import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/icons/icons.dart';
import 'package:reacthome/ui/widgets/list/list_section/list_section.dart';
import 'package:reacthome/ui/widgets/list/list_tile/list_tile.dart';
import 'package:reacthome/ui/widgets/switch/switch.dart';

class DiscoveryStatus extends StatelessWidget {
  const DiscoveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final model = context.read<DiscoveryStatusViewModel>();
    final isDiscovering = context.select<DiscoveryStatusViewModel, bool>(
      (model) => model.isDiscovering,
    );
    return ListSection(children: [
      ListTile(
        title: Text(locale.discovery),
        leading: Icon(Icons.search),
        trailing: Switch(
          value: isDiscovering,
          onChanged: model.toggleDiscovery,
        ),
      ),
    ]);
  }
}
