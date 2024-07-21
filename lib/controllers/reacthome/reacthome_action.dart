sealed class ReacthomeAction {
  const ReacthomeAction();
}

class ReacthomeActionSet extends ReacthomeAction {
  static const type = 'ACTION_SET';

  final String id;
  final Map<String, dynamic> payload;

  const ReacthomeActionSet({
    required this.id,
    required this.payload,
  });
}
