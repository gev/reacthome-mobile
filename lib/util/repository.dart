import 'package:reacthome/util/entity.dart';

abstract interface class Repository<K, V extends Entity<K>> {
  Iterable<K> getAll();
  bool has(K id);
  V? get(String id);
  void add(V daemon);
  void remove(K id);
}

class InMemoryRepository<K, V extends Entity<K>> implements Repository<K, V> {
  final Map<K, V> _store = {};

  @override
  Iterable<K> getAll() => _store.keys;

  @override
  bool has(K id) => _store.containsKey(id);

  @override
  V? get(String id) => _store[id];

  @override
  void add(V entity) => _store[entity.id] = entity;

  @override
  void remove(K id) => _store.remove(id);
}
