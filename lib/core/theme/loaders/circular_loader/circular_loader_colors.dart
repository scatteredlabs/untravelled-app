import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledCircularLoaderColors extends ThemeExtension<UntravelledCircularLoaderColors> with DiagnosticableTreeMixin {
  /// Circular loader color.
  final Color color;

  /// Circular loader background color.
  final Color backgroundColor;

  const UntravelledCircularLoaderColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  UntravelledCircularLoaderColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return UntravelledCircularLoaderColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledCircularLoaderColors lerp(ThemeExtension<UntravelledCircularLoaderColors>? other, double t) {
    if (other is! UntravelledCircularLoaderColors) return this;

    return UntravelledCircularLoaderColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularLoaderColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
