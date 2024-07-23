import 'package:reacthome/common/entity.dart';

abstract interface class Repository<K, V extends Entity<K>> {
  int get length;
  Iterable<K> get keys;
  Iterable<V> get values;
  bool has(K id);
  V? get(K id);
  void put(V home);
  V? remove(K id);
  void clear();
}
