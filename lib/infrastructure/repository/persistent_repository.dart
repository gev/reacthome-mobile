import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reacthome/common/entity.dart';
import 'package:reacthome/common/repository.dart';

const defaultTimeout = Duration(milliseconds: 100);

class PersistentRepository<E extends Entity<String>>
    implements Repository<String, E> {
  final File _file;
  final E Function(dynamic json) _fromJson;
  final dynamic Function(E entity) _toJson;

  late Timer _timer;

  PersistentRepository._(
    this._file,
    this._fromJson,
    this._toJson,
    Duration timeout,
  ) {
    _timer = Timer.periodic(
      timeout,
      (_) => _save(),
    );
  }

  static final _instances = <String, dynamic>{};

  static Future<PersistentRepository<T>> make<T extends Entity<String>>({
    required String name,
    required String scope,
    required T Function(dynamic json) fromJson,
    required dynamic Function(T entity) toJson,
    Duration timeout = defaultTimeout,
  }) async {
    final location = await getApplicationDocumentsDirectory();
    final directory = join(location.path, scope);
    await Directory(directory).create(recursive: true);
    final path = join(directory, name);
    if (_instances.containsKey(path)) {
      return _instances[path]!;
    }
    final repository =
        PersistentRepository._(File(path), fromJson, toJson, timeout);
    await repository._load();
    _instances[path] = repository;
    return repository;
  }

  int _storeTimestamp = 0;
  int _fileTimestamp = 0;
  bool _done = true;
  var _store = <String, E>{};

  Future<void> _save() async {
    if (_storeTimestamp > _fileTimestamp && _done) {
      _fileTimestamp = _storeTimestamp;
      _done = false;
      final json = <String, dynamic>{};
      _store.forEach((id, entity) {
        json[id] = _toJson(entity);
      });
      await _file.writeAsString(jsonEncode(json));
      _done = true;
    }
  }

  Future<void> _load() async {
    try {
      final tmp = <String, E>{};
      if (await _file.exists()) {
        final data = await _file.readAsString();
        if (data.isNotEmpty) {
          final entries = jsonDecode(data) as Map<String, dynamic>;
          entries.forEach((key, value) {
            tmp[key] = _fromJson(value);
          });
          _store = tmp;
        }
      }
    } catch (_) {}
  }

  @override
  int get length => _store.length;

  @override
  Iterable<String> getAllId() => _store.keys;

  @override
  Iterable<E> getAll() => _store.values;

  @override
  bool has(String id) => _store.containsKey(id);

  @override
  E? get(String id) => _store[id];

  @override
  void put(E entity) {
    _store[entity.id] = entity;
    _storeTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  E? remove(String id) {
    final e = _store.remove(id);
    if (e != null) {
      _storeTimestamp = DateTime.now().millisecondsSinceEpoch;
    }
    return e;
  }

  @override
  void clear() {
    _store.clear();
    _storeTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  void dispose() {
    _timer.cancel();
    _save();
  }
}
