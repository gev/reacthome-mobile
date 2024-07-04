import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reacthome/app/features/discovery_factory.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
// import 'package:provider/provider.dart';
// import 'package:reacthome/ui/fragments/discovery/view_models/discovery_status_view_model.dart';
import 'package:reacthome/ui/kit/kit.dart';

class DiscoveryStatus extends StatelessWidget {
  const DiscoveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    // final model = context.read<DiscoveryStatusViewModel>();
    // final isDiscovering = context.select<DiscoveryStatusViewModel, bool>(
    //   (model) => model.isDiscovering,
    // );
    print('test');
    final service = DiscoveryFactory.instance.makeDiscoveryService();
    final stream = DiscoveryFactory.instance.discoveryEventBus.stream.map(
      (event) {
        print(event);
        return event is DiscoveryStartCompletedEvent;
      },
    );
    service.stop();
    // service.start();
    return list.tile(
      title: Text(locale.discovery),
      leading: Icon(icon.search),
      trailing: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            final state = snapshot.data;
            print(state);
            return switcher(
              value: state == true,
              onChanged: (_) =>
                  state == true ? service.stop() : service.start(),
            );
          }),
      // trailing: switcher(
      //   value: isDiscovering,
      //   onChanged: model.toggleDiscovery,
      // ),
    );
  }
}
