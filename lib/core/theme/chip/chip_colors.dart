import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledChipColors extends ThemeExtension<UntravelledChipColors> with DiagnosticableTreeMixin {
  /// Chip text and border color when active.
  final Color activeColor;

  /// Chip background color.
  final Color backgroundColor;

  /// Chip background color when active.
  final Color activeBackgroundColor;

  /// Chip text color.
  final Color textColor;

  const UntravelledChipColors({
    required this.activeColor,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.textColor,
  });

  @override
  UntravelledChipColors copyWith({
    Color? activeColor,
    Color? backgroundColor,
    Color? activeBackgroundColor,
    Color? textColor,
  }) {
    return UntravelledChipColors(
      activeColor: activeColor ?? this.activeColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  UntravelledChipColors lerp(ThemeExtension<UntravelledChipColors>? other, double t) {
    if (other is! UntravelledChipColors) return this;

    return UntravelledChipColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      activeBackgroundColor: colorPremulLerp(activeBackgroundColor, other.activeBackgroundColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledChipColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBackgroundColor", activeBackgroundColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
