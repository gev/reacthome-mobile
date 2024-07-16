import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reacthome/entity_framework/box.dart';

const defaultTimeout = Duration(milliseconds: 100);

class PersistentBox<V> implements Box<V> {
  final File _file;
  final V? Function(dynamic json) _fromJson;
  final dynamic Function(V? value) _toJson;

  late Timer _timer;

  PersistentBox._(
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

  static Future<PersistentBox<T>> make<T>({
    required String name,
    required String scope,
    required T Function(dynamic json) fromJson,
    required dynamic Function(T? value) toJson,
    Duration timeout = defaultTimeout,
  }) async {
    final location = await getApplicationDocumentsDirectory();
    final directory = join(location.path, scope);
    await Directory(directory).create(recursive: true);
    final path = join(directory, name);
    if (_instances.containsKey(path)) {
      return _instances[path]!;
    }
    final repository = PersistentBox._(File(path), fromJson, toJson, timeout);
    await repository._load();
    _instances[path] = repository;
    return repository;
  }

  int _storeTimestamp = 0;
  int _fileTimestamp = 0;
  bool _done = true;
  V? _store;

  Future<void> _save() async {
    if (_storeTimestamp > _fileTimestamp && _done) {
      _fileTimestamp = _storeTimestamp;
      _done = false;
      final json = jsonEncode(_toJson(_store));
      await _file.writeAsString(json);
      _done = true;
    }
  }

  Future<void> _load() async {
    try {
      if (await _file.exists()) {
        final data = await _file.readAsString();
        if (data.isNotEmpty) {
          _store = _fromJson(jsonDecode(data));
        }
      }
    } catch (_) {}
  }

  @override
  V? get() => _store;

  @override
  void put(V value) {
    _store = value;
    _storeTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  void clear() {
    _store = null;
    _storeTimestamp = DateTime.now().millisecondsSinceEpoch;
  }

  void dispose() {
    _timer.cancel();
    _save();
  }
}
