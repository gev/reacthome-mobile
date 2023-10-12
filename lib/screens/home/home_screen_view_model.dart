import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reacthome/domains/discovery/discovery_data_provider.dart';
import 'package:reacthome/domains/discovery/discovery_action.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int _counter = 0;

  final DiscoveryDataProvider discovery;
  late StreamSubscription<DiscoveryAction> _subscription;

  HomeScreenViewModel(this.discovery) {
    _subscription = discovery.subscribe(_onDiscovery);
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
