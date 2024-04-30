import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTabBarProperties extends ThemeExtension<UntravelledTabBarProperties> with DiagnosticableTreeMixin {
  /// Gap between TabBar children.
  final double gap;

  /// TabBar transition duration.
  final Duration transitionDuration;

  /// TabBar transition curve.
  final Curve transitionCurve;

  const UntravelledTabBarProperties({
    required this.gap,
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  UntravelledTabBarProperties copyWith({
    double? gap,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return UntravelledTabBarProperties(
      gap: gap ?? this.gap,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  UntravelledTabBarProperties lerp(ThemeExtension<UntravelledTabBarProperties>? other, double t) {
    if (other is! UntravelledTabBarProperties) return this;

    return UntravelledTabBarProperties(
      gap: lerpDouble(gap, other.gap, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTabBarProperties"))
      ..add(DoubleProperty("gap", gap))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve));
  }
}
