import 'dart:convert';
import 'dart:io';

import 'package:reacthome/infrastructure/repository/memory_box.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class JsonBox<T> {
  final MemoryBox<T> _box;
  final From<T?> _fromJson;
  final To<T?> _toJson;

  const JsonBox(this._box, this._fromJson, this._toJson);

  Future<void> load(File file) async {
    try {
      final data = await file.readAsString();
      if (data.isNotEmpty) {
        _box.init(_fromJson(jsonDecode(data)));
      }
    } catch (_) {}
  }

  Future<void> save(File file) async {
    final json = jsonEncode(_toJson(_box.value));
    file.writeAsString(json);
  }
}
