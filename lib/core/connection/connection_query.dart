abstract interface class ConnectionQuery<C> {
  Iterable<String> getAllConnections();
  C getConnectionById(String id);
}
