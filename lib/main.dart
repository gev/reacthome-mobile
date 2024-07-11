import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:reacthome/app/make.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Connectivity().onConnectivityChanged.listen(
    (List<ConnectivityResult> result) {
      print('onConnectivityChanged: $result');
    },
  );

  runApp(make());
}
