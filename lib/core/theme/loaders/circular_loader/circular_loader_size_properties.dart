import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledCircularLoaderSizeProperties extends ThemeExtension<UntravelledCircularLoaderSizeProperties>
    with DiagnosticableTreeMixin {
  /// Circular loader size value.
  final double loaderSizeValue;

  /// Circular loader stroke width.
  final double loaderStrokeWidth;

  const UntravelledCircularLoaderSizeProperties({
    required this.loaderSizeValue,
    required this.loaderStrokeWidth,
  });

  @override
  UntravelledCircularLoaderSizeProperties copyWith({
    double? loaderSizeValue,
    double? loaderStrokeWidth,
  }) {
    return UntravelledCircularLoaderSizeProperties(
      loaderSizeValue: loaderSizeValue ?? this.loaderSizeValue,
      loaderStrokeWidth: loaderStrokeWidth ?? this.loaderStrokeWidth,
    );
  }

  @override
  UntravelledCircularLoaderSizeProperties lerp(ThemeExtension<UntravelledCircularLoaderSizeProperties>? other, double t) {
    if (other is! UntravelledCircularLoaderSizeProperties) return this;

    return UntravelledCircularLoaderSizeProperties(
      loaderSizeValue: lerpDouble(loaderSizeValue, other.loaderSizeValue, t)!,
      loaderStrokeWidth: lerpDouble(loaderStrokeWidth, other.loaderStrokeWidth, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularLoaderSizeProperties"))
      ..add(DoubleProperty("loaderSizeValue", loaderSizeValue))
      ..add(DoubleProperty("loaderStrokeWidth", loaderStrokeWidth));
  }
}
