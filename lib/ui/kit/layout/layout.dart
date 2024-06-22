import 'package:flutter/widgets.dart';

class LayoutContainer {
  final LayoutPadding padding;
  const LayoutContainer({required this.padding});
}

class LayoutPadding {
  final double start;
  final double top;
  final double end;
  final double bottom;

  const LayoutPadding({
    required this.start,
    required this.top,
    required this.end,
    required this.bottom,
  });

  double get horizontal => start + end;

  double get vertical => top + bottom;

  EdgeInsetsDirectional get edgeInsets =>
      EdgeInsetsDirectional.fromSTEB(start, top, end, bottom);

  EdgeInsetsDirectional get edgeInsetsFullWidth =>
      EdgeInsetsDirectional.fromSTEB(0, top, 0, bottom);

  Widget all({Widget? child}) => Padding(
        padding: edgeInsets,
        child: child,
      );

  Widget fullWidth({Widget? child}) => Padding(
        padding: edgeInsetsFullWidth,
        child: child,
      );
}
