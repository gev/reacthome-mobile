import 'dart:io';

import 'package:path/path.dart';

class FileStore<T> {
  final String path;
  final List<int> Function(T data) toBytes;
  final T Function(List<int> bytes) fromBytes;

  FileStore._(this.path, this.toBytes, this.fromBytes);

  static Future<FileStore<T>> make<T>({
    required String path,
    required List<int> Function(T data) toBytes,
    required T Function(List<int> bytes) fromBytes,
  }) async {
    await Directory(dirname(path)).create(recursive: true);
    return FileStore._(path, toBytes, fromBytes);
  }

  Future<bool> has(String id) async {
    final file = _getFile(id);
    return file.exists();
  }

  Future<T> get(String id) async {
    final file = _getFile(id);
    final data = await file.readAsBytes();
    return fromBytes(data);
  }

  void put(String id, T data) async {
    final file = _getFile(id);
    file.writeAsBytes(toBytes(data));
  }

  File _getFile(String id) => File(join(path, '$id.json'));
}

class FileStoreFactory<T> {
  final String path;
  final String? scope;
  final List<int> Function(T data) toBytes;
  final T Function(List<int> bytes) fromBytes;

  FileStoreFactory({
    required this.path,
    this.scope,
    required this.toBytes,
    required this.fromBytes,
  });

  FileStore<T> make(String id) => FileStore<T>(
        path: join(path, id, scope),
        toBytes: toBytes,
        fromBytes: fromBytes,
      );
}
