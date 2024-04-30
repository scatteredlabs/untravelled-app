import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledRadioColors extends ThemeExtension<UntravelledRadioColors> with DiagnosticableTreeMixin {
  /// Radio active color.
  final Color activeColor;

  /// Radio inactive color.
  final Color inactiveColor;

  /// Radio text color.
  final Color textColor;

  const UntravelledRadioColors({
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
  });

  @override
  UntravelledRadioColors copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? textColor,
  }) {
    return UntravelledRadioColors(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  UntravelledRadioColors lerp(ThemeExtension<UntravelledRadioColors>? other, double t) {
    if (other is! UntravelledRadioColors) return this;

    return UntravelledRadioColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      inactiveColor: colorPremulLerp(inactiveColor, other.inactiveColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledRadioColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("inactiveColor", inactiveColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
