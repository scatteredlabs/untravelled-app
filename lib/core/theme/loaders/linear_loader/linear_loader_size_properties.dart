import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledLinearLoaderSizeProperties extends ThemeExtension<UntravelledLinearLoaderSizeProperties>
    with DiagnosticableTreeMixin {
  /// Linear loader border radius.
  final BorderRadiusGeometry borderRadius;

  /// Linear loader height.
  final double loaderHeight;

  const UntravelledLinearLoaderSizeProperties({
    required this.borderRadius,
    required this.loaderHeight,
  });

  @override
  UntravelledLinearLoaderSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? loaderHeight,
  }) {
    return UntravelledLinearLoaderSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      loaderHeight: loaderHeight ?? this.loaderHeight,
    );
  }

  @override
  UntravelledLinearLoaderSizeProperties lerp(ThemeExtension<UntravelledLinearLoaderSizeProperties>? other, double t) {
    if (other is! UntravelledLinearLoaderSizeProperties) return this;

    return UntravelledLinearLoaderSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      loaderHeight: lerpDouble(loaderHeight, other.loaderHeight, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearLoaderSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("loaderHeight", loaderHeight));
  }
}
