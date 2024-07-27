///
abstract interface class BoxRepository<V> {
  V get value;
  void put(V value);
}
