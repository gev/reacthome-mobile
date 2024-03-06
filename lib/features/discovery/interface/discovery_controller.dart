import 'dart:io';

import 'package:reacthome/core/home/home_api.dart';
import 'package:reacthome/core/home/home_event.dart';
import 'package:reacthome/core/meta.dart';
import 'package:reacthome/features/discovery/interface/discovery_action.dart';
import 'package:reacthome/util/event_emitter.dart';
import 'package:reacthome/util/handler.dart';

class DiscoveryController extends GenericEventEmitter<HomeEvent>
    implements Handler<Datagram> {
  final HomeApi actor;

  DiscoveryController({
    required super.eventSink,
    required this.actor,
  });
  @override
  void handle(Datagram datagram) {
    final action = DiscoveryAction.fromData(datagram.data);
    if (action != null) {
      actor.addHome(
        id: action.id,
        meta: Meta(
          title: action.payload.title,
          code: action.payload.code,
        ),
        project: action.payload.project,
        address: datagram.address,
      );
      eventSink.emit(HomeConfirmedEvent(action.id));
    }
  }
}
