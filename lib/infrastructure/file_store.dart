import 'dart:io';

import 'package:path/path.dart';

typedef ToBytes<T> = List<int> Function(T data);
typedef FromBytes<T> = T Function(List<int> bytes);

class FileStore<T> {
  final String path;
  final List<int> Function(T data) toBytes;
  final T Function(List<int> bytes) fromBytes;

  const FileStore._(this.path, this.toBytes, this.fromBytes);

  static Future<FileStore<T>> make<T>({
    required String path,
    required ToBytes<T> toBytes,
    required FromBytes<T> fromBytes,
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
  final ToBytes<T> toBytes;
  final FromBytes<T> fromBytes;

  const FileStoreFactory({
    required this.path,
    this.scope,
    required this.toBytes,
    required this.fromBytes,
  });

  Future<FileStore<T>> make(String id) async => FileStore.make(
        path: join(path, id, scope),
        toBytes: toBytes,
        fromBytes: fromBytes,
      );
}
