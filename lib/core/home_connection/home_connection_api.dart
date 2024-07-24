import 'package:reacthome/core/home_connection/home_connection.dart';

abstract interface class HomeConnectionApi {
  HomeConnection getConnectionById(String id);

  void connectAll(Iterable<String> ids);
  void connect(String id);

  void connectLocalAll(Iterable<String> ids);
  void connectLocal(String id);

  void connectCloudAll(Iterable<String> ids);
  void connectCloud(String id);

  void disconnectAll();
  void disconnect(String id);

  void disconnectLocalAll();
  void disconnectLocal(String id);

  void disconnectCloudAll();
  void disconnectCloud(String id);

  void select(String id);
}
