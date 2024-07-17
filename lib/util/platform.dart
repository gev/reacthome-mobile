import 'dart:io';

/// Selects the appropriate platform-specific value based on the current platform.
///
/// Returns the value of the [cupertino] parameter if the current platform
/// is iOS or macOS, otherwise returns the value of the [material] parameter.
T selectPlatform<T>({
  required T cupertino,
  required T material,
}) =>
    Platform.isIOS || Platform.isMacOS ? cupertino : material;
