import 'package:reacthome/features/discovery/application/discovery_process_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_entity.dart';
import 'package:reacthome/features/discovery/domain/discovery_process_state.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';

class DiscoveryProcessRepository implements DiscoveryProcess {
  final MulticastSourceFactory factory;
  final DiscoveryProcessEntity _process =
      DiscoveryProcessEntity(DiscoveryProcessState.stopped);
  late MulticastSource _source;

  DiscoveryProcessRepository({required this.factory});

  @override
  DiscoveryProcessEntity get process => _process;

  @override
  Future<void> set(DiscoveryProcessEntity process) async {
    switch (process.state) {
      case DiscoveryProcessState.starting:
        _start();
      case DiscoveryProcessState.stopped:
        _stop();
      default:
    }
  }

  void _start() async => _source = await factory.create();

  void _stop() => _source.close();

  void dispose() => _stop();
}
