import 'package:reacthome/common/box.dart';

class MemoryBox<V> implements Box<V> {
  V? _store;

  void init(V? value) => _store = value;

  @override
  V? get() => _store;

  @override
  void put(V entity) => _store = entity;

  @override
  void clear() => _store = null;
}
