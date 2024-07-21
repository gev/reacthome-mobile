import 'package:flutter/widgets.dart';
import 'package:reacthome/infrastructure/bus/bus_listener.dart';

abstract class ViewModel<E> extends BusListener<E> with ChangeNotifier {
  ViewModel({required super.eventSource});

  bool shouldNotify(E event);

  @override
  void handle(E event) {
    if (shouldNotify(event)) {
      notifyListeners();
    }
  }
}
