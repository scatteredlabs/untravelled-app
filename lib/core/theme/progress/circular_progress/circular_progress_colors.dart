import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledCircularProgressColors extends ThemeExtension<UntravelledCircularProgressColors> with DiagnosticableTreeMixin {
  /// Circular progress color.
  final Color color;

  /// Circular progress background color.
  final Color backgroundColor;

  const UntravelledCircularProgressColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  UntravelledCircularProgressColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return UntravelledCircularProgressColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledCircularProgressColors lerp(ThemeExtension<UntravelledCircularProgressColors>? other, double t) {
    if (other is! UntravelledCircularProgressColors) return this;

    return UntravelledCircularProgressColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularProgressColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
