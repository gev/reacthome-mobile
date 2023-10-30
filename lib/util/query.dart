abstract interface class Query<Q, R> {
  R run(Q query);
}
