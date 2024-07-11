import 'dart:io';

import 'package:reacthome/core/home/home.dart';
import 'package:reacthome/core/home_connection/home_connection.dart';

abstract interface class HomeConnectionApi {
  Iterable<String> getAllConnections();
  HomeConnection getConnectionById(String id);

  void connectAll(Iterable<Home> homes);
  void connect(Home home);
  void connectLocal(Home home);
  void connectCloud(Home home);
  void reconnectLocal(Home home, InternetAddress address);

  void disconnectAll();
  void disconnect(String id);
  void disconnectLocal(String id);
  void disconnectCloud(String id);

  void select(String id);
}
