import 'dart:async';

class ReplayLatestStream<T> extends StreamView<T> {
  T _latest;

  ReplayLatestStream(this._latest, Stream<T> stream) : super(stream) {
    stream.listen((latest) {
      _latest = latest;
    });
  }

  @override
  StreamSubscription<T> listen(void Function(T value)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    if (onData != null) {
      Future(() {
        onData(_latest);
      });
    }
    return super.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}

extension ReplayLatestStreamExtension<T> on Stream<T> {
  Stream<T> replayLatest(T startWith) => ReplayLatestStream<T>(startWith, this);
}
