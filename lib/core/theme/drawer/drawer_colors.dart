import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledDrawerColors extends ThemeExtension<UntravelledDrawerColors> with DiagnosticableTreeMixin {
  /// Drawer text color.
  final Color textColor;

  /// Drawer icon color.
  final Color iconColor;

  /// Drawer background color.
  final Color backgroundColor;

  /// Drawer barrier color.
  final Color barrierColor;

  const UntravelledDrawerColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.barrierColor,
  });

  @override
  UntravelledDrawerColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return UntravelledDrawerColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
    );
  }

  @override
  UntravelledDrawerColors lerp(ThemeExtension<UntravelledDrawerColors>? other, double t) {
    if (other is! UntravelledDrawerColors) return this;

    return UntravelledDrawerColors(
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
      ..add(DiagnosticsProperty("type", "UntravelledDrawerColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("barrierColor", barrierColor));
  }
}
