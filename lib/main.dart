import 'package:flutter/widgets.dart';
import 'package:reacthome/make/make.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await make());
}
