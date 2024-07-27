import 'dart:convert';
import 'dart:io';

import 'package:reacthome/common/entity.dart';
import 'package:reacthome/infrastructure/repository/memory_map_repository.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class JsonMapRepository<E extends Entity<String>> {
  final MemoryMapRepository<String, E> _repository;
  final From<E> _fromJson;
  final To<E> _toJson;

  const JsonMapRepository(this._repository, this._fromJson, this._toJson);

  Future<void> load(File file) async {
    try {
      final tmp = <String, E>{};
      final data = await file.readAsString();
      if (data.isNotEmpty) {
        final entries = jsonDecode(data) as Map<String, dynamic>;
        entries.forEach((key, value) {
          tmp[key] = _fromJson(value);
        });
        _repository.init(tmp);
      }
    } catch (_) {}
  }

  Future<void> save(File file) async {
    final json = <String, dynamic>{};
    for (var entity in _repository.values) {
      json[entity.id] = _toJson(entity);
    }
    file.writeAsString(jsonEncode(json));
  }
}
