abstract interface class PreferencesApi {
  Iterable<String> get homes;
  String? get home;
  String? get project;
  void addHome(String id);
  void removeHome(String id);
  void setHome(String id);
  void setProject(String id);
}
