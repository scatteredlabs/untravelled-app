import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledModalColors extends ThemeExtension<UntravelledModalColors> with DiagnosticableTreeMixin {
  /// Modal text color.
  final Color textColor;

  /// Modal icon color.
  final Color iconColor;

  /// Modal background color.
  final Color backgroundColor;

  /// Modal barrier color.
  final Color barrierColor;

  const UntravelledModalColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.barrierColor,
  });

  @override
  UntravelledModalColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return UntravelledModalColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
    );
  }

  @override
  UntravelledModalColors lerp(ThemeExtension<UntravelledModalColors>? other, double t) {
    if (other is! UntravelledModalColors) return this;

    return UntravelledModalColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      barrierColor: colorPremulLerp(barrierColor, other.barrierColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledModalColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("barrierColor", barrierColor));
  }
}
