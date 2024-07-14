import 'package:flutter/widgets.dart';
import 'package:reacthome/app/make.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await make());
}
