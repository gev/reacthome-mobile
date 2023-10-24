import 'package:reacthome/core/discovery_event.dart';
import 'package:reacthome/features/discovery/domain/discovery_daemon.dart';

class DiscoveryAggregate {
  final Map<String, DiscoveryDaemon> _map;
  final List<String> _list;

  DiscoveryAggregate(this._map, this._list);

  Iterable<String> get daemons => _list;

  DiscoveryDaemon? getDaemonById(String id) => _map[id];

  DiscoveryEvent addDaemon(String id, DiscoveryDaemon daemon) {
    if (!_map.keys.contains(id)) {
      _list.add(id);
      _map[id] = daemon;
      return DiscoveryEventDaemonAdded(id);
    } else if (_map[id] != daemon) {
      _map[id] = daemon;
      return DiscoveryEventDaemonChanged(id);
    }
    return DiscoveryEventDaemonConfirmed(id);
  }

  DiscoveryEvent? removeDaemon(String id) {
    if (_map.containsKey(id)) {
      _list.remove(id);
      _map.remove(id);
      return DiscoveryEventDaemonRemoved(id);
    }
    return null;
  }
}
