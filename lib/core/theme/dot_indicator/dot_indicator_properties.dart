import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledDotIndicatorProperties extends ThemeExtension<UntravelledDotIndicatorProperties> with DiagnosticableTreeMixin {
  /// DotIndicator gap between dots.
  final double gap;

  /// DotIndicator dot size.
  final double size;

  /// DotIndicator transition duration.
  final Duration transitionDuration;

  /// DotIndicator transition curve.
  final Curve transitionCurve;

  const UntravelledDotIndicatorProperties({
    required this.size,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.gap,
  });

  @override
  UntravelledDotIndicatorProperties copyWith({
    double? gap,
    double? size,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return UntravelledDotIndicatorProperties(
      gap: gap ?? this.gap,
      size: size ?? this.size,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  UntravelledDotIndicatorProperties lerp(ThemeExtension<UntravelledDotIndicatorProperties>? other, double t) {
    if (other is! UntravelledDotIndicatorProperties) return this;

    return UntravelledDotIndicatorProperties(
      gap: lerpDouble(gap, other.gap, t)!,
      size: lerpDouble(size, other.size, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledDotIndicatorProperties"))
      ..add(DoubleProperty("gap", gap))
      ..add(DoubleProperty("size", size))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve));
  }
}
