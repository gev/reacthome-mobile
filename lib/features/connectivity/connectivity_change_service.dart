import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:reacthome/features/connectivity/connectivity_api.dart';
import 'package:reacthome/features/connectivity/connectivity_state.dart';

class ConnectivityChangeService {
  final ConnectivityApi connectivity;

  ConnectivityChangeService({required this.connectivity}) {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.none)) {
          connectivity.makeDisconnected();
        } else {
          connectivity.makeConnected(ConnectivityState(
            hasEthernet: result.contains(ConnectivityResult.ethernet),
            hasWifi: result.contains(ConnectivityResult.wifi),
            hasMobile: result.contains(ConnectivityResult.mobile),
            hasVpn: result.contains(ConnectivityResult.vpn),
            hasBluetooth: result.contains(ConnectivityResult.bluetooth),
            hasOther: result.contains(ConnectivityResult.other),
          ));
        }
      },
    );
  }
}
