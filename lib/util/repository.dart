import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:reacthome/util/entity.dart';

abstract interface class Repository<K, V extends Entity<K>> {
  Iterable<K> getAll();
  bool has(K id);
  V? get(K id);
  void add(V daemon);
  void remove(K id);
}

class InMemoryRepository<K, V extends Entity<K>> implements Repository<K, V> {
  IMap<K, V> _store = IMap();

  @override
  Iterable<K> getAll() => _store.keys;

  @override
  bool has(K id) => _store.containsKey(id);

  @override
  V? get(K id) => _store.get(id);

  @override
  void add(V entity) => _store = _store.add(entity.id, entity);

  @override
  void remove(K id) => _store = _store.remove(id);
}
