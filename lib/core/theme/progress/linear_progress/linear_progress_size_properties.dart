import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledLinearProgressSizeProperties extends ThemeExtension<UntravelledLinearProgressSizeProperties>
    with DiagnosticableTreeMixin {
  /// Linear progress border radius.
  final BorderRadiusGeometry borderRadius;

  /// Linear progress height.
  final double progressHeight;

  const UntravelledLinearProgressSizeProperties({
    required this.borderRadius,
    required this.progressHeight,
  });

  @override
  UntravelledLinearProgressSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? progressHeight,
  }) {
    return UntravelledLinearProgressSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      progressHeight: progressHeight ?? this.progressHeight,
    );
  }

  @override
  UntravelledLinearProgressSizeProperties lerp(ThemeExtension<UntravelledLinearProgressSizeProperties>? other, double t) {
    if (other is! UntravelledLinearProgressSizeProperties) return this;

    return UntravelledLinearProgressSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      progressHeight: lerpDouble(progressHeight, other.progressHeight, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearProgressSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("progressHeight", progressHeight));
  }
}
