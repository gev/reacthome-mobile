import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:reacthome/util/entity.dart';
import 'package:reacthome/util/repository/repository.dart';

class ImmutableMapRepository<K, V extends Entity<K>>
    implements InMemoryRepository<K, V> {
  IMap<K, V> _store = IMap();

  @override
  Iterable<K> getAllId() => _store.keys;

  @override
  Iterable<V> getAll() => _store.values;

  @override
  bool has(K id) => _store.containsKey(id);

  @override
  V? get(K id) => _store.get(id);

  @override
  void add(V entity) => _store = _store.add(entity.id, entity);

  @override
  void remove(K id) => _store = _store.remove(id);

  @override
  void clear() => _store = IMap();
}
