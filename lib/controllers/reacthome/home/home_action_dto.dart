import 'package:reacthome/controllers/reacthome/home/home_action.dart';

class HomeActionDto {
  HomeActionDto._();

  static HomeAction? fromJSON(Map<String, dynamic> json) => HomeAction(
        title: json['title'],
        code: json['code'],
        project: json['project'],
      );
}
