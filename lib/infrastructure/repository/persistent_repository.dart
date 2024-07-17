import 'dart:async';

import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/repository.dart';
import 'package:reacthome/infrastructure/repository/json_repository.dart';
import 'package:reacthome/infrastructure/repository/memory_repository.dart';
import 'package:reacthome/infrastructure/repository/persistent.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

const defaultTimeout = Duration(milliseconds: 100);

class PersistentRepository<E extends Entity<String>>
    implements Repository<String, E> {
  final Persistent _persistent;
  final Repository<String, E> _repository;

  const PersistentRepository._(this._persistent, this._repository);

  static final _instances = <String, PersistentRepository>{};

  static Future<PersistentRepository<T>> make<T extends Entity<String>>({
    required String name,
    required String scope,
    required From<T> fromJson,
    required To<T> toJson,
    Duration timeout = defaultTimeout,
  }) async {
    final key = '$scope/$name';
    if (_instances.containsKey(key)) {
      return _instances[key]! as PersistentRepository<T>;
    }
    final repository = MemoryRepository<String, T>();
    final jsonRepository = JsonRepository(repository, fromJson, toJson);
    final persistent = await Persistent.make(
      name,
      scope,
      fromFile: jsonRepository.load,
      toFile: jsonRepository.save,
      timeout: timeout,
    );
    final persistentRepository = PersistentRepository._(persistent, repository);
    _instances[key] = persistentRepository;
    return persistentRepository;
  }

  @override
  int get length => _repository.length;

  @override
  Iterable<String> getAllId() => _repository.getAllId();

  @override
  Iterable<E> getAll() => _repository.getAll();

  @override
  bool has(String id) => _repository.has(id);

  @override
  E? get(String id) => _repository.get(id);

  @override
  void put(E entity) {
    _repository.put(entity);
    _persistent.setTimestamp();
  }

  @override
  E? remove(String id) {
    final e = _repository.remove(id);
    if (e != null) {
      _persistent.setTimestamp();
    }
    return e;
  }

  @override
  void clear() {
    _repository.clear();
    _persistent.setTimestamp();
  }

  void dispose() => _persistent.dispose();
}
