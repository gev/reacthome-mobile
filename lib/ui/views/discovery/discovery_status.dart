import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/view_models/discovery_view_model.dart';
import 'package:reacthome/ui_kit/kit.dart';

class DiscoveryStatus extends StatelessWidget {
  final DiscoveryViewModel viewModel;

  const DiscoveryStatus(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return list.tile(
      title: Text(locale.discovery),
      leading: Icon(icon.search),
      trailing: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) => switcher(
          value: viewModel.state,
          onChanged: viewModel.toggleDiscovery,
        ),
      ),
    );
  }
}
