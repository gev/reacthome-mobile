import 'dart:async';

import 'package:reacthome/common/repository/box_repository.dart';
import 'package:reacthome/infrastructure/repository/json_box_repository_dto.dart';
import 'package:reacthome/infrastructure/repository/memory_box_repository.dart';
import 'package:reacthome/infrastructure/repository/persistent.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class PersistentBoxRepository<V> implements BoxRepository<V> {
  final Persistent _persistent;
  final BoxRepository<V> _box;

  const PersistentBoxRepository._(this._persistent, this._box);

  static final _instances = <String, PersistentBoxRepository>{};

  static Future<PersistentBoxRepository<T>> make<T>(
    T initialValue, {
    required String name,
    required String scope,
    required From<T?> fromJson,
    required To<T> toJson,
    Duration timeout = Persistent.defaultTimeout,
  }) async {
    final key = '$scope/$name';
    if (_instances.containsKey(key)) {
      return _instances[key]! as PersistentBoxRepository<T>;
    }
    final box = MemoryBoxRepository<T>(initialValue);
    final file = JsonBoxRepositoryDto(box, fromJson, toJson);
    final persistent = await Persistent.make(
      name,
      scope,
      fromFile: file.load,
      toFile: file.save,
      timeout: timeout,
    );
    final persistentBox = PersistentBoxRepository._(persistent, box);
    _instances[key] = persistentBox;
    return persistentBox;
  }

  @override
  V get value => _box.value;

  @override
  void put(V value) {
    _box.put(value);
    _persistent.updateTimestamp();
  }

  void dispose() => _persistent.dispose();
}
