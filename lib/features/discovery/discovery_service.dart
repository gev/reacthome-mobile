import 'package:reacthome/features/discovery/discovery_entity.dart';
import 'package:reacthome/features/discovery/discovery_event.dart';
import 'package:reacthome/features/discovery/discovery_repository.dart';
import 'package:reacthome/features/discovery/discovery_state.dart';
import 'package:reacthome/util/bus.dart';
import 'package:reacthome/util/bus_emitter.dart';
import 'package:reacthome/util/extensions.dart';

class DiscoveryService extends SimpleBusEmitter<DiscoveryEvent> {
  final DiscoveryRepository repository;

  DiscoveryService(this.repository, {required Bus<DiscoveryEvent> eventSink})
      : super(eventSink);

  DiscoveryEntity get _model => repository.state;
  DiscoveryState get state => _model.state;

  void start() => _model.start()?.let(emit);
  void run() => _model.run()?.let(emit);
  void stop() => _model.stop()?.let(emit);
}
