import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/common/view_model_builder.dart';
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
      trailing: ViewModelBuilder(
        viewModel: viewModel,
        builder: (context, viewModel, _) => switcher(
          value: viewModel.state,
          onChanged: viewModel.toggleDiscovery,
        ),
      ),
    );
  }
}
