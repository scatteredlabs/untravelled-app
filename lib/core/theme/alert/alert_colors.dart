import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledAlertColors extends ThemeExtension<UntravelledAlertColors> with DiagnosticableTreeMixin {
  /// Alert background color.
  final Color backgroundColor;

  /// Alert border color.
  final Color borderColor;

  /// Alert icon color.
  final Color iconColor;

  /// Alert text color.
  final Color textColor;

  const UntravelledAlertColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  UntravelledAlertColors copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return UntravelledAlertColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  UntravelledAlertColors lerp(ThemeExtension<UntravelledAlertColors>? other, double t) {
    if (other is! UntravelledAlertColors) return this;

    return UntravelledAlertColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAlertColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
