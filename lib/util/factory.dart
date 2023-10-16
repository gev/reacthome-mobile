abstract interface class AsyncFactory<T> {
  Future<T> create();
}
