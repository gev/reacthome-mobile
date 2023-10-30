mixin class Pool<T> {
  final Set<T> _pool = {};
  Iterable<T> get pool => _pool;
  void add(T item) => _pool.add(item);
  void remove(T item) => _pool.remove(item);
  void clear() => _pool.clear();
}
