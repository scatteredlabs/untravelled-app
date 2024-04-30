import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledCheckboxColors extends ThemeExtension<UntravelledCheckboxColors> with DiagnosticableTreeMixin {
  /// Checkbox active color.
  final Color activeColor;

  /// Checkbox border color.
  final Color borderColor;

  /// Checkbox icon color.
  final Color checkColor;

  /// Checkbox inactive color.
  final Color inactiveColor;

  /// Checkbox text color.
  final Color textColor;

  const UntravelledCheckboxColors({
    required this.activeColor,
    required this.borderColor,
    required this.checkColor,
    required this.inactiveColor,
    required this.textColor,
  });

  @override
  UntravelledCheckboxColors copyWith({
    Color? activeColor,
    Color? borderColor,
    Color? checkColor,
    Color? inactiveColor,
    Color? textColor,
  }) {
    return UntravelledCheckboxColors(
      activeColor: activeColor ?? this.activeColor,
      borderColor: borderColor ?? this.borderColor,
      checkColor: checkColor ?? this.checkColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  UntravelledCheckboxColors lerp(ThemeExtension<UntravelledCheckboxColors>? other, double t) {
    if (other is! UntravelledCheckboxColors) return this;

    return UntravelledCheckboxColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      checkColor: colorPremulLerp(checkColor, other.checkColor, t)!,
      inactiveColor: colorPremulLerp(inactiveColor, other.inactiveColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCheckboxColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("checkColor", checkColor))
      ..add(ColorProperty("inactiveColor", inactiveColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
