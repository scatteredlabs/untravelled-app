import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTextInputColors extends ThemeExtension<UntravelledTextInputColors> with DiagnosticableTreeMixin {
  /// TextInput background color.
  final Color backgroundColor;

  /// TextInput active border color.
  final Color activeBorderColor;

  /// TextInput inactive border color.
  final Color inactiveBorderColor;

  /// TextInput error color.
  final Color errorColor;

  /// TextInput hover border color.
  final Color hoverBorderColor;

  /// TextInput text color.
  final Color textColor;

  /// TextInput helper text color.
  final Color helperTextColor;

  const UntravelledTextInputColors({
    required this.backgroundColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
    required this.errorColor,
    required this.hoverBorderColor,
    required this.textColor,
    required this.helperTextColor,
  });

  @override
  UntravelledTextInputColors copyWith({
    Color? backgroundColor,
    Color? activeBorderColor,
    Color? inactiveBorderColor,
    Color? errorColor,
    Color? hoverBorderColor,
    Color? textColor,
    Color? helperTextColor,
  }) {
    return UntravelledTextInputColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      inactiveBorderColor: inactiveBorderColor ?? this.inactiveBorderColor,
      errorColor: errorColor ?? this.errorColor,
      hoverBorderColor: hoverBorderColor ?? this.hoverBorderColor,
      textColor: textColor ?? this.textColor,
      helperTextColor: helperTextColor ?? this.helperTextColor,
    );
  }

  @override
  UntravelledTextInputColors lerp(ThemeExtension<UntravelledTextInputColors>? other, double t) {
    if (other is! UntravelledTextInputColors) return this;

    return UntravelledTextInputColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      activeBorderColor: colorPremulLerp(activeBorderColor, other.activeBorderColor, t)!,
      inactiveBorderColor: colorPremulLerp(inactiveBorderColor, other.inactiveBorderColor, t)!,
      errorColor: colorPremulLerp(errorColor, other.errorColor, t)!,
      hoverBorderColor: colorPremulLerp(hoverBorderColor, other.hoverBorderColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      helperTextColor: colorPremulLerp(helperTextColor, other.helperTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBorderColor", activeBorderColor))
      ..add(ColorProperty("inactiveBorderColor", inactiveBorderColor))
      ..add(ColorProperty("errorColor", errorColor))
      ..add(ColorProperty("hoverBorderColor", hoverBorderColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("helperTextColor", helperTextColor));
  }
}
