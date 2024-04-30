import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledLinearLoaderColors extends ThemeExtension<UntravelledLinearLoaderColors> with DiagnosticableTreeMixin {
  /// Linear loader color.
  final Color color;

  /// Linear loader background color.
  final Color backgroundColor;

  const UntravelledLinearLoaderColors({
    required this.color,
    required this.backgroundColor,
  });

  @override
  UntravelledLinearLoaderColors copyWith({
    Color? color,
    Color? backgroundColor,
  }) {
    return UntravelledLinearLoaderColors(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledLinearLoaderColors lerp(ThemeExtension<UntravelledLinearLoaderColors>? other, double t) {
    if (other is! UntravelledLinearLoaderColors) return this;

    return UntravelledLinearLoaderColors(
      color: colorPremulLerp(color, other.color, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearLoaderColors"))
      ..add(ColorProperty("color", color))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
