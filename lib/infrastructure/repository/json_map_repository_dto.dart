import 'dart:convert';
import 'dart:io';

import 'package:reacthome/common/entity.dart';
import 'package:reacthome/infrastructure/repository/memory_map_repository.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class JsonMapRepositoryDto<E extends Entity<String>> {
  final MemoryMapRepository<String, E> _repository;
  final From<E> _fromJson;
  final To<E> _toJson;

  const JsonMapRepositoryDto(this._repository, this._fromJson, this._toJson);

  Future<void> load(File file) async {
    final tmp = <String, E>{};
    final data = await file.readAsString();
    final entries = jsonDecode(data) as Map<String, dynamic>;
    entries.forEach((key, value) {
      tmp[key] = _fromJson(value);
    });
    _repository.init(tmp);
  }

  Future<void> save(File file) async {
    final json = <String, dynamic>{};
    for (var entity in _repository.values) {
      json[entity.id] = _toJson(entity);
    }
    await file.writeAsString(jsonEncode(json));
  }
}
