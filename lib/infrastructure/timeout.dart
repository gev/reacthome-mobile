import 'dart:async';

class Timeout<K> {
  final Map<K, Timer> _timers = {};

  Timeout();

  void set({
    required K id,
    required Duration duration,
    required void Function() execute,
  }) {
    _timers[id]?.cancel();
    _timers[id] = Timer(duration, execute);
  }

  void cancel({required K id}) {
    _timers[id]?.cancel();
    _timers.remove(id);
  }
}
