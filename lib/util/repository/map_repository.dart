import 'package:reacthome/util/entity.dart';
import 'package:reacthome/util/repository/repository.dart';

class MapRepository<K, V extends Entity<K>> implements Repository<K, V> {
  final _store = <K, V>{};

  @override
  int get length => _store.length;

  MapRepository();

  @override
  Iterable<K> getAllId() => _store.keys;

  @override
  Iterable<V> getAll() => _store.values;

  @override
  bool has(K id) => _store.containsKey(id);

  @override
  V? get(K id) => _store[id];

  @override
  void set(V entity) => _store[entity.id] = entity;

  @override
  void remove(K id) => _store.remove(id);

  @override
  void clear() => _store.clear();
}
