abstract interface class PreferencesApi {
  String? get home;
  bool get isHomeSelected;
  void setHome(String id);
  void removePreferredHome(String id);
}
