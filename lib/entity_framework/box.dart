abstract interface class Box<V> {
  V? get();
  void put(V value);
  void clear();
}
