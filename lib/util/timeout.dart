import 'dart:async';

class Timeout<K> {
  final _timers = <K, Timer>{};

  Timeout();

  /// Sets a timer with the given [id] and [duration]
  /// to execute the [execute] function.
  ///
  /// The [id] parameter is used to identify the timer.
  /// If a timer with the same [id] already exists,
  /// it will be canceled before setting a new one.
  ///
  /// The [duration] parameter specifies the duration
  /// for which the timer should wait before executing
  /// the [execute] function.
  ///
  /// The [execute] parameter is a function that
  /// will be executed when the timer expires.
  void set(
    K id, {
    required Duration duration,
    required void Function() execute,
  }) {
    _timers[id]?.cancel();
    _timers[id] = Timer(duration, execute);
  }

  /// Cancels the timer with the given [id] if it exists.
  void cancel(id) {
    _timers[id]?.cancel();
    _timers.remove(id);
  }
}
