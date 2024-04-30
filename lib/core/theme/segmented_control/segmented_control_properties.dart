import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledSegmentedControlProperties extends ThemeExtension<UntravelledSegmentedControlProperties>
    with DiagnosticableTreeMixin {
  /// SegmentedControl border radius.
  final BorderRadiusGeometry borderRadius;

  /// Gap between SegmentControl segments.
  final double gap;

  /// SegmentedControl transition duration.
  final Duration transitionDuration;

  /// SegmentedControl transition curve.
  final Curve transitionCurve;

  /// SegmentedControl padding.
  final EdgeInsetsGeometry padding;

  const UntravelledSegmentedControlProperties({
    required this.borderRadius,
    required this.gap,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.padding,
  });

  @override
  UntravelledSegmentedControlProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? padding,
  }) {
    return UntravelledSegmentedControlProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      padding: padding ?? this.padding,
    );
  }

  @override
  UntravelledSegmentedControlProperties lerp(ThemeExtension<UntravelledSegmentedControlProperties>? other, double t) {
    if (other is! UntravelledSegmentedControlProperties) return this;

    return UntravelledSegmentedControlProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSegmentedControlProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("gap", gap))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding));
  }
}
