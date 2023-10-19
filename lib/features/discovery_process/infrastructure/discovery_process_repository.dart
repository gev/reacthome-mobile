import 'package:reacthome/features/discovery_process/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery_process/domain/discovery_process_state.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';

class DiscoveryProcessRepository implements DiscoveryProcess {
  final MulticastSourceFactory factory;
  late DiscoveryProcessState _state;
  late MulticastSource _source;

  DiscoveryProcessRepository({required this.factory}) {
    _start();
  }

  @override
  DiscoveryProcessEntity get process => DiscoveryProcessEntity(_state);

  @override
  void set(DiscoveryProcessState state) {
    switch (state) {
      case DiscoveryProcessState.running:
        _start();
      case DiscoveryProcessState.stopped:
        _stop();
    }
  }

  void _start() async {
    _source = await factory.create();
    _state = DiscoveryProcessState.running;
  }

  void _stop() {
    _source.close();
    _state = DiscoveryProcessState.stopped;
  }

  void dispose() => _stop();
}
