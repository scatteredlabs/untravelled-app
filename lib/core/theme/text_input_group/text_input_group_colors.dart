import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTextInputGroupColors extends ThemeExtension<UntravelledTextInputGroupColors> with DiagnosticableTreeMixin {
  /// TextInputGroup background color.
  final Color backgroundColor;

  /// TextInputGroup error color.
  final Color errorColor;

  /// TextInputGroup helper text color.
  final Color helperTextColor;

  /// TextInputGroup inactive border color.
  final Color borderColor;

  /// TextInputGroup hover border color.
  final Color hoverBorderColor;

  const UntravelledTextInputGroupColors({
    required this.backgroundColor,
    required this.errorColor,
    required this.helperTextColor,
    required this.borderColor,
    required this.hoverBorderColor,
  });

  @override
  UntravelledTextInputGroupColors copyWith({
    Color? backgroundColor,
    Color? errorColor,
    Color? helperTextColor,
    Color? borderColor,
    Color? hoverBorderColor,
  }) {
    return UntravelledTextInputGroupColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      errorColor: errorColor ?? this.errorColor,
      helperTextColor: helperTextColor ?? this.helperTextColor,
      borderColor: borderColor ?? this.borderColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
    );
  }

  @override
  UntravelledTextInputGroupColors lerp(ThemeExtension<UntravelledTextInputGroupColors>? other, double t) {
    if (other is! UntravelledTextInputGroupColors) return this;

    return UntravelledTextInputGroupColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      errorColor: colorPremulLerp(errorColor, other.errorColor, t)!,
      helperTextColor: colorPremulLerp(helperTextColor, other.helperTextColor, t)!,
      borderColor: colorPremulLerp(borderColor, other.borderColor, t)!,
      hoverBorderColor: colorPremulLerp(hoverBorderColor, other.hoverBorderColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputGroupColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("errorColor", errorColor))
      ..add(ColorProperty("helperTextColor", helperTextColor))
      ..add(ColorProperty("borderColor", borderColor))
      ..add(ColorProperty("hoverBorderColor", hoverBorderColor));
  }
}
