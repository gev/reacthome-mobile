import 'package:flutter/widgets.dart';
import 'package:reacthome/di.dart';

final DI di = DI();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(di.app());
}
