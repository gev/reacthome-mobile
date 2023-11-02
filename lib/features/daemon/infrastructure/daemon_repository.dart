import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:reacthome/core/daemon/daemon_collection.dart';
import 'package:reacthome/features/daemon/domain/daemon_entity.dart';

class DaemonRepository implements DaemonCollection {
  var _daemons = IMap<String, DaemonEntity>();

  @override
  Iterable<String> getAllDaemons() => _daemons.keys;

  @override
  bool hasDaemon(String id) => _daemons.containsKey(id);

  @override
  DaemonEntity? getDaemon(String id) => _daemons.get(id);

  @override
  void addDaemon(DaemonEntity daemon) =>
      _daemons = _daemons.add(daemon.id, daemon);

  @override
  void removeDaemon(String id) => _daemons = _daemons.remove(id);
}
