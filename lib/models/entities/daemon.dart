import 'package:reacthome/models/entities/entity.dart';

const String daemon = 'daemon';

class Daemon extends Entity {
  Daemon({title, code, this.project, this.device})
      : super(title: title, code: code, type: daemon);
  String? project;
  List<String>? device;
}
