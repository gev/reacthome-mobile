import 'package:reacthome/common/repository/box_repository.dart';

class MemoryBoxRepository<V> implements BoxRepository<V> {
  V _store;

  MemoryBoxRepository(this._store);

  void init(V value) => _store = value;

  @override
  V get value => _store;

  @override
  void put(V entity) => _store = entity;
}
