import 'package:reacthome/util/entity.dart';

abstract interface class Repository<K, V extends Entity<K>> {
  bool has(K id);
  V? get(K id);
  void add(V home);
  void remove(K id);
  void clear();
}

abstract interface class InMemoryRepository<K, V extends Entity<K>>
    extends Repository<K, V> {
  Iterable<K> getAllId();
  Iterable<V> getAll();
}
