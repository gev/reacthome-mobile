import 'dart:async';

import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/repository/map_repository.dart';
import 'package:reacthome/infrastructure/repository/json_map_repository_dto.dart';
import 'package:reacthome/infrastructure/repository/memory_map_repository.dart';
import 'package:reacthome/infrastructure/repository/persistent.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

const defaultTimeout = Duration(milliseconds: 100);

class PersistentMapRepository<E extends Entity<String>>
    implements MapRepository<String, E> {
  final Persistent _persistent;
  final MapRepository<String, E> _repository;

  const PersistentMapRepository._(
    this._persistent,
    this._repository,
  );

  static final _instances = <String, PersistentMapRepository>{};

  static Future<PersistentMapRepository<T>> make<T extends Entity<String>>({
    required String name,
    required String scope,
    required From<T> fromJson,
    required To<T> toJson,
    Duration timeout = defaultTimeout,
  }) async {
    final key = '$scope/$name';
    if (_instances.containsKey(key)) {
      return _instances[key]! as PersistentMapRepository<T>;
    }
    final repository = MemoryMapRepository<String, T>();
    final jsonRepository = JsonMapRepository(repository, fromJson, toJson);
    final persistent = await Persistent.make(
      name,
      scope,
      fromFile: jsonRepository.load,
      toFile: jsonRepository.save,
      timeout: timeout,
    );
    final persistentRepository =
        PersistentMapRepository._(persistent, repository);
    _instances[key] = persistentRepository;
    return persistentRepository;
  }

  @override
  int get length => _repository.length;

  @override
  Iterable<String> get keys => _repository.keys;

  @override
  Iterable<E> get values => _repository.values;

  @override
  bool has(String id) => _repository.has(id);

  @override
  E? get(String id) => _repository.get(id);

  @override
  void put(E entity) {
    _repository.put(entity);
    _persistent.updateTimestamp();
  }

  @override
  E? remove(String id) {
    final e = _repository.remove(id);
    if (e != null) {
      _persistent.updateTimestamp();
    }
    return e;
  }

  @override
  void clear() {
    _repository.clear();
    _persistent.updateTimestamp();
  }

  void dispose() => _persistent.dispose();
}
