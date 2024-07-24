import 'package:reacthome/common/bus/bus_listener.dart';
import 'package:reacthome/core/connectivity/connectivity_api.dart';
import 'package:reacthome/core/discovery/discovery_api.dart';
import 'package:reacthome/core/discovery/discovery_event.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source.dart';
import 'package:reacthome/infrastructure/multicast/multicast_source_factory.dart';

class DiscoveryMulticastService extends BusListener<DiscoveryEvent> {
  final DiscoveryApi<MulticastSource> discoveryApi;
  final ConnectivityApi connectivityApi;
  final MulticastSourceFactory factory;

  DiscoveryMulticastService({
    required super.eventSource,
    required this.discoveryApi,
    required this.connectivityApi,
    required this.factory,
  });

  @override
  void handle(DiscoveryEvent event) async {
    switch (event) {
      case DiscoveryStartRequestedEvent _:
        if (connectivityApi.state.hasWifi ||
            connectivityApi.state.hasEthernet) {
          _completeStartProcess();
        } else {
          discoveryApi.stop();
        }
      case DiscoveryRejectedEvent<MulticastSource> e:
        _reject(e.source);
      case DiscoveryStopRequestedEvent<MulticastSource> e:
        _completeStopProcess(e.source);
      default:
    }
  }

  void _completeStartProcess() async {
    final source = await factory.create();
    discoveryApi.completeStart(source);
  }

  void _reject(MulticastSource source) {
    source.close();
  }

  void _completeStopProcess(MulticastSource source) {
    source.close();
    discoveryApi.completeStop();
  }
}
