import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reacthome/infrastructure/repository/types.dart';

class Persistent {
  static const defaultTimeout = Duration(milliseconds: 100);

  final File _file;
  final FileHandler _fromFile;
  final FileHandler _toFile;

  late Timer _timer;

  Persistent._(
    this._file,
    this._fromFile,
    this._toFile,
    Duration timeout,
  ) {
    _timer = Timer.periodic(
      timeout,
      (_) => _save(),
    );
  }

  static Future<Persistent> make<T>(
    String name,
    String scope, {
    required FileHandler fromFile,
    required FileHandler toFile,
    required Duration timeout,
  }) async {
    final location = await getApplicationDocumentsDirectory();
    final directory = join(location.path, scope);
    await Directory(directory).create(recursive: true);
    final path = join(directory, name);
    final persistent = Persistent._(File(path), fromFile, toFile, timeout);
    await persistent._load();
    return persistent;
  }

  int _storeTimestamp = 0;
  int _fileTimestamp = 0;
  bool _done = true;

  bool get _shouldSave => _storeTimestamp > _fileTimestamp && _done;

  Future<void> _save() async {
    if (_shouldSave) {
      _fileTimestamp = _storeTimestamp;
      _done = false;
      await _toFile(_file);
      _done = true;
    }
  }

  Future<void> _load() async {
    try {
      if (await _file.exists()) {
        await _fromFile(_file);
      }
    } catch (_) {}
  }

  void setTimestamp() =>
      _storeTimestamp = DateTime.now().millisecondsSinceEpoch;

  void dispose() {
    _timer.cancel();
    _save();
  }
}
