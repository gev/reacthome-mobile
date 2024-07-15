import 'package:reacthome/features/home/home.dart';
import 'package:reacthome/features/home_connection/home_connection.dart';

abstract interface class HomeConnectionApi {
  Iterable<String> getAllConnectionsId();
  Iterable<HomeConnection> getAllConnections();

  HomeConnection getConnectionById(String id);

  void connectAll(Iterable<Home> homes);
  void connect(Home home);

  void connectLocalAll(Iterable<Home> homes);
  void connectLocal(Home home);

  void connectCloudAll(Iterable<Home> homes);
  void connectCloud(Home home);

  void disconnectAll();
  void disconnect(String id);

  void disconnectLocalAll();
  void disconnectLocal(String id);

  void disconnectCloudAll();
  void disconnectCloud(String id);

  void select(String id);
}
