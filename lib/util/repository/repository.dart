import 'package:reacthome/util/entity.dart';

abstract interface class Repository<K, V extends Entity<K>> {
  int get length;
  Iterable<K> getAllId();
  Iterable<V> getAll();
  bool has(K id);
  V? get(K id);
  void set(V home);
  void remove(K id);
  void clear();
}
