import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/repository.dart';

class MemoryRepository<K, V extends Entity<K>> implements Repository<K, V> {
  var _store = <K, V>{};

  @override
  int get length => _store.length;

  void init(Map<K, V> entities) => _store = entities;

  @override
  Iterable<K> get keys => _store.keys;

  @override
  Iterable<V> get values => _store.values;

  @override
  bool has(K id) => _store.containsKey(id);

  @override
  V? get(K id) => _store[id];

  @override
  void put(V entity) => _store[entity.id] = entity;

  @override
  V? remove(K id) => _store.remove(id);

  @override
  void clear() => _store.clear();
}
