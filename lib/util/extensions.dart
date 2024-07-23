extension Let<T> on T {
  /// Applies the given function [f] to the value of type [T]
  /// and returns the result of type [R].
  ///
  /// The function [f] takes a value of type [T] as its argument
  /// and returns a value of type [R].
  ///
  /// Example usage:
  /// ```dart
  /// int? number = null;
  /// String? result = number.let((num) => 'The number is: $num');
  /// print(result); // Output: null
  ///
  /// If the value of type [T] is `null`, the `let` method will gracefully
  /// handle it by not executing the function [f] and returning `null`.
  ///
  /// int? number = 42;
  /// String? result = number.let((num) => 'The number is: $num');
  /// print(result); // Output: The number is: 42
  /// ```
  R let<R>(R Function(T) f) => f(this);
}
