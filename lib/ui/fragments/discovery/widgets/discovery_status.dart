import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryStatus extends StatelessWidget {
  const DiscoveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final service = DiscoveryFactory.instance.makeDiscoveryService();
    final stream = DiscoveryFactory.instance.discoveryEventBus.stream.map(
      (event) => event is DiscoveryStartCompletedEvent,
    );
    return list.tile(
      title: Text(locale.discovery),
      leading: Icon(icon.search),
      trailing: StreamBuilder(
        stream: stream,
        initialData: false,
        builder: (context, snapshot) {
          final state = snapshot.data!;
          return switcher(
            value: state,
            onChanged: (_) => state ? service.stop() : service.start(),
          );
        },
      ),
    );
  }
}
