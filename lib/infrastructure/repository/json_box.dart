import 'dart:convert';
import 'dart:io';

import 'package:reacthome/infrastructure/repository/memory_box.dart';
import 'package:reacthome/infrastructure/repository/types.dart';
import 'package:reacthome/util/extensions.dart';

class JsonBox<T> {
  final MemoryBox<T> _box;
  final From<T?> _fromJson;
  final To<T?> _toJson;

  const JsonBox(this._box, this._fromJson, this._toJson);

  Future<void> load(File file) async {
    try {
      final data = await file.readAsString();
      _fromJson(jsonDecode(data))?.let(_box.init);
    } catch (_) {}
  }

  Future<void> save(File file) async {
    final json = jsonEncode(_toJson(_box.value));
    file.writeAsString(json);
  }
}
