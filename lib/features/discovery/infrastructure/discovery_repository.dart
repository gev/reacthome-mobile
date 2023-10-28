import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:reacthome/features/discovery/application/discovery_service.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';

class DiscoveryRepository implements Discovery {
  var _daemons = IMap<String, DiscoveryDaemon>();

  @override
  Iterable<String> getAllDaemons() => _daemons.keys;

  @override
  bool hasDaemon(String id) => _daemons.containsKey(id);

  @override
  DiscoveryDaemon? getDaemon(String id) => _daemons.get(id);

  @override
  void setDaemon(String id, DiscoveryDaemon daemon) =>
      _daemons = _daemons.add(id, daemon);

  @override
  void removeDaemon(String id) => _daemons = _daemons.remove(id);
}
