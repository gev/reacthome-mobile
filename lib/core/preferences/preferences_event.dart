sealed class PreferencesEvent {
  const PreferencesEvent();
}

class PreferencesHomeAddedEvent extends PreferencesEvent {
  final String id;
  const PreferencesHomeAddedEvent(this.id);
}

class PreferencesHomeRemovedEvent extends PreferencesEvent {
  final String id;
  const PreferencesHomeRemovedEvent(this.id);
}
