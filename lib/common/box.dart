///
abstract interface class Box<V> {
  V? get value;
  void put(V value);
  void clear();
}
