abstract interface class PreferencesApi {
  Iterable<String> get homes;
  String? get home;
  void addHome(String id);
  void removeHome(String id);
  void setHome(String id);
}
