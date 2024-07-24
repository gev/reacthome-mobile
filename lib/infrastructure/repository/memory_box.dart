import 'package:reacthome/common/box.dart';

class MemoryBox<V> implements Box<V> {
  V _store;

  MemoryBox(this._store);

  void init(V value) => _store = value;

  @override
  V get value => _store;

  @override
  void put(V entity) => _store = entity;
}
