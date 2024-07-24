sealed class PreferencesEvent {
  final String id;
  const PreferencesEvent(this.id);
}

class PreferencesHomeSelectedEvent extends PreferencesEvent {
  const PreferencesHomeSelectedEvent(super.id);
}

class PreferencesHomeRemovedEvent extends PreferencesEvent {
  const PreferencesHomeRemovedEvent(super.id);
}
