import 'package:flutter/src/widgets/framework.dart';
import 'package:reacthome/core/discovery/discovery_command.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/core/discovery/discovery_query.dart';
import 'package:reacthome/ui/fragments/discovery/discovery_status_view_model.dart';
import 'package:reacthome/util/event_bus.dart';
import 'package:reacthome/util/factory.dart';

class DiscoveryStatusViewModelFactory
    implements Factory<DiscoveryStatusViewModel> {
  final EventBus<DiscoveryEvent> eventSource;
  final DiscoveryQuery query;
  final DiscoveryCommand actor;

  DiscoveryStatusViewModelFactory({
    required this.eventSource,
    required this.query,
    required this.actor,
  });

  @override
  DiscoveryStatusViewModel create(BuildContext context) =>
      DiscoveryStatusViewModel(
        eventSource: eventSource,
        query: query,
        actor: actor,
      );
}
