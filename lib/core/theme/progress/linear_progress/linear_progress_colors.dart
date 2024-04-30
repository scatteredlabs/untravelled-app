import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledLinearProgressColors extends ThemeExtension<UntravelledLinearProgressColors> with DiagnosticableTreeMixin {
  /// Linear progress color.
  final Color color;

  /// Linear progress background color.
  final Color backgroundColor;

  const UntravelledLinearProgressColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  UntravelledLinearProgressColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return UntravelledLinearProgressColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledLinearProgressColors lerp(ThemeExtension<UntravelledLinearProgressColors>? other, double t) {
    if (other is! UntravelledLinearProgressColors) return this;

    return UntravelledLinearProgressColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearProgressColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
