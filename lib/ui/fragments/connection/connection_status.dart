import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reacthome/ui/fragments/connection/connection_status_view_model.dart';

class ConnectionStatus extends StatelessWidget {
  final String id;
  const ConnectionStatus({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select<ConnectionStatusViewModel, String>(
      (model) => model.connectionStatus(id),
    );
    return Text(status);
  }
}
