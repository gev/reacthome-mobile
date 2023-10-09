import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reacthome/features/discovery/discovery.dart';
import 'package:reacthome/features/discovery/discovery_action.dart';

class HomeViewModel extends ChangeNotifier {
  int _counter = 0;

  final Discovery discovery;
  late StreamSubscription<DiscoveryAction> _subscription;

  HomeViewModel(this.discovery) {
    _subscription = discovery.stream.listen(_onDiscovery);
  }

  String get counter => _counter.toString();

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  _onDiscovery(DiscoveryAction action) {
    incrementCounter();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
