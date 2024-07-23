import 'dart:async';

import 'package:reacthome/common/box.dart';
import 'package:reacthome/infrastructure/repository/json_box.dart';
import 'package:reacthome/infrastructure/repository/memory_box.dart';
import 'package:reacthome/infrastructure/repository/persistent.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class PersistentBox<V> implements Box<V> {
  final Persistent _persistent;
  final Box<V> _box;

  const PersistentBox._(this._persistent, this._box);

  static final _instances = <String, PersistentBox>{};

  static Future<PersistentBox<T>> make<T>({
    required String name,
    required String scope,
    required From<T?> fromJson,
    required To<T?> toJson,
    Duration timeout = Persistent.defaultTimeout,
  }) async {
    final key = '$scope/$name';
    if (_instances.containsKey(key)) {
      return _instances[key]! as PersistentBox<T>;
    }
    final box = MemoryBox<T>();
    final file = JsonBox(box, fromJson, toJson);
    final persistent = await Persistent.make(
      name,
      scope,
      fromFile: file.load,
      toFile: file.save,
      timeout: timeout,
    );
    final persistentBox = PersistentBox._(persistent, box);
    _instances[key] = persistentBox;
    return persistentBox;
  }

  @override
  V? get value => _box.value;

  @override
  void put(V value) {
    _box.put(value);
    _persistent.updateTimestamp();
  }

  @override
  void clear() {
    _box.clear();
    _persistent.updateTimestamp();
  }

  void dispose() => _persistent.dispose();
}
