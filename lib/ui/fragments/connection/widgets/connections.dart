import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/infrastructure/ui/kit/kit.dart';
import 'package:reacthome/ui/fragments/connection/view_models/connection_view_model.dart';
import 'package:reacthome/ui/fragments/connection/widgets/connection.dart';

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
  Widget build(BuildContext context) => StreamBuilder(
        stream: viewModel.stream(id),
        initialData: viewModel.getConnectionState(id),
        builder: (context, snapshot) {
          final locale = AppLocalizations.of(context)!;
          final state = snapshot.data!;
          return list.section(
            context,
            children: [
              Connection(
                isConnected: state.isConnected,
                title: locale.connection,
                onToggle: viewModel.toggleConnection(id),
              ),
              Connection(
                isConnected: state.isLocalConnected,
                title: locale.localConnection,
                subtitle: localAddress,
                onToggle: viewModel.toggleLocalConnection(id),
              ),
              Connection(
                isConnected: state.isCloudConnected,
                title: locale.cloudConnection,
                subtitle: 'gate.reacthome.net',
                onToggle: viewModel.toggleCloudConnection(id),
              ),
            ],
          );
        },
      );
}
