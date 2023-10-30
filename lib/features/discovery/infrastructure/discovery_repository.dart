import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:reacthome/features/discovery/application/discovery_collection.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';

class DiscoveryRepository implements DiscoveryCollection {
  var _daemons = IMap<String, DiscoveryDaemonEntity>();

  @override
  Iterable<String> getAllDaemons() => _daemons.keys;

  @override
  bool hasDaemon(String id) => _daemons.containsKey(id);

  @override
  DiscoveryDaemonEntity? getDaemon(String id) => _daemons.get(id);

  @override
  void addDaemon(DiscoveryDaemonEntity daemon) =>
      _daemons = _daemons.add(daemon.id, daemon);

  @override
  void removeDaemon(String id) => _daemons = _daemons.remove(id);
}
