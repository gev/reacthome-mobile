import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/common/view_model_builder.dart';
import 'package:reacthome/ui/view_models/connection_view_model.dart';
import 'package:reacthome/ui/views/connection/connection.dart';
import 'package:reacthome/ui_kit/kit.dart';

class Connections extends StatelessWidget {
  final String id;
  final String? localAddress;
  final ConnectionsViewModel viewModel;

  const Connections(
    this.id,
    this.localAddress,
    this.viewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => ViewModelBuilder(
        viewModel: viewModel.getConnectionViewModel(id),
        builder: (context, viewModel, _) {
          final locale = AppLocalizations.of(context)!;
          return list.section(
            context,
            children: [
              Connection(
                isConnected: viewModel.isConnected,
                title: locale.connection,
                onToggle: viewModel.toggleConnection,
              ),
              Connection(
                isConnected: viewModel.isLocalConnected,
                title: locale.localConnection,
                subtitle: localAddress,
                onToggle: viewModel.toggleLocalConnection,
              ),
              Connection(
                isConnected: viewModel.isCloudConnected,
                title: locale.cloudConnection,
                subtitle: 'gate.reacthome.net',
                onToggle: viewModel.toggleCloudConnection,
              ),
            ],
          );
        },
      );
}
