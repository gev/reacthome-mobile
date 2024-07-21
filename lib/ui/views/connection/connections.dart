import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/ui/view_models/connection_view_model.dart';
import 'package:reacthome/ui/views/connection/connection.dart';
import 'package:reacthome/ui_kit/kit.dart';

class Connections extends StatelessWidget {
  final String id;
  final String? localAddress;
  final ConnectionViewModel viewModel;

  const Connections(
    this.id,
    this.localAddress,
    this.viewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          final locale = AppLocalizations.of(context)!;
          return list.section(
            context,
            children: [
              Connection(
                isConnected: viewModel.isConnected(id),
                title: locale.connection,
                onToggle: viewModel.toggleConnection(id),
              ),
              Connection(
                isConnected: viewModel.isLocalConnected(id),
                title: locale.localConnection,
                subtitle: localAddress,
                onToggle: viewModel.toggleLocalConnection(id),
              ),
              Connection(
                isConnected: viewModel.isCloudConnected(id),
                title: locale.cloudConnection,
                subtitle: 'gate.reacthome.net',
                onToggle: viewModel.toggleCloudConnection(id),
              ),
            ],
          );
        },
      );
}
