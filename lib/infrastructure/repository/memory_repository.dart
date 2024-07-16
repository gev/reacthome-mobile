import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/repository.dart';

class MemoryRepository<K, V extends Entity<K>> implements Repository<K, V> {
  final _store = <K, V>{};

  @override
  int get length => _store.length;

  MemoryRepository();

  @override
  Iterable<K> getAllId() => _store.keys;

  @override
  Iterable<V> getAll() => _store.values;

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
