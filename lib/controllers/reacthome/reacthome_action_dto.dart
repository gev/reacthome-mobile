import 'dart:convert';

import 'package:reacthome/controllers/reacthome/reacthome_action.dart';

class ReacthomeActionDto {
  ReacthomeActionDto._();

  static ReacthomeAction? fromString(String data) {
    final json = jsonDecode(data);
    final type = json['type'];
    switch (type) {
      case ReacthomeActionSet.type:
        return ReacthomeActionSetDto.fromJson(json);
      default:
        return null;
    }
  }
}

class ReacthomeActionSetDto {
  ReacthomeActionSetDto._();

  static ReacthomeActionSet fromJson(Map<String, dynamic> json) =>
      ReacthomeActionSet(
        id: json['id'],
        payload: json['payload'],
      );
}
