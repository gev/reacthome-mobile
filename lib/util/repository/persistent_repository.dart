import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:reacthome/util/entity.dart';
import 'package:reacthome/util/repository/repository.dart';

const defaultTimeout = Duration(milliseconds: 100);

class PersistentRepository implements Repository<String, Entity<String>> {
  final File file;
  final Entity<String> Function(dynamic json) fromJson;
  final dynamic Function(Entity<String> entity) toJson;
  bool _shouldSave = false;
  bool _done = true;
  late Timer _timer;
  var _store = <String, Entity<String>>{};

  PersistentRepository({
    required this.file,
    required this.fromJson,
    required this.toJson,
    Duration timeout = defaultTimeout,
  }) {
    _timer = Timer.periodic(timeout, (_) => _save());
  }

  void _save() async {
    if (_shouldSave && _done) {
      _done = false;
      final json = <String, dynamic>{};
      _store.forEach((id, entity) {
        json[id] = toJson(entity);
      });
      await file.writeAsString(jsonEncode(json));
      _shouldSave = false;
      _done = true;
    }
  }

  void load() async {
    try {
      final tmp = <String, Entity<String>>{};
      final data = await file.readAsString();
      if (data.isNotEmpty) {
        final entries = jsonDecode(data) as Map<String, dynamic>;
        entries.forEach((key, value) {
          tmp[key] = fromJson(value);
        });
        _store = tmp;
      }
    } catch (_) {}
  }

  @override
  Iterable<String> getAllId() => _store.keys;

  @override
  Iterable<Entity<String>> getAll() => _store.values;

  @override
  bool has(String id) => _store.containsKey(id);

  @override
  Entity<String>? get(String id) => _store[id];

  @override
  void set(Entity<String> entity) {
    _store[entity.id] = entity;
    _shouldSave = true;
  }

  @override
  void remove(String id) {
    _store.remove(id);
    _shouldSave = true;
  }

  @override
  void clear() {
    _store.clear();
    _shouldSave = true;
  }

  void dispose() {
    _timer.cancel();
    _save();
  }
}
