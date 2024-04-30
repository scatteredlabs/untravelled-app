import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledCircularProgressSizeProperties extends ThemeExtension<UntravelledCircularProgressSizeProperties>
    with DiagnosticableTreeMixin {
  /// Circular progress size value.
  final double progressSizeValue;

  /// Circular progress stroke width.
  final double progressStrokeWidth;

  const UntravelledCircularProgressSizeProperties({
    required this.progressSizeValue,
    required this.progressStrokeWidth,
  });

  @override
  UntravelledCircularProgressSizeProperties copyWith({
    double? progressSizeValue,
    double? progressStrokeWidth,
  }) {
    return UntravelledCircularProgressSizeProperties(
      progressSizeValue: progressSizeValue ?? this.progressSizeValue,
      progressStrokeWidth: progressStrokeWidth ?? this.progressStrokeWidth,
    );
  }

  @override
  UntravelledCircularProgressSizeProperties lerp(ThemeExtension<UntravelledCircularProgressSizeProperties>? other, double t) {
    if (other is! UntravelledCircularProgressSizeProperties) return this;

    return UntravelledCircularProgressSizeProperties(
      progressSizeValue: lerpDouble(progressSizeValue, other.progressSizeValue, t)!,
      progressStrokeWidth: lerpDouble(progressStrokeWidth, other.progressStrokeWidth, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularProgressSizeProperties"))
      ..add(DoubleProperty("progressSizeValue", progressSizeValue))
      ..add(DoubleProperty("progressStrokeWidth", progressStrokeWidth));
  }
}
