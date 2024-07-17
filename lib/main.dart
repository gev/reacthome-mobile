import 'package:flutter/widgets.dart';
import 'package:reacthome/make/make.dart';

/// Initializes the Flutter application and runs it.
///
/// This function is the entry point of the Flutter application.
/// It ensures that the Flutter binding is initialized
/// and then runs the application by calling the `runApp()`.
///
/// The `make()` function is responsible for creating
/// and configuring the root widget of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await make());
}
