import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTextAreaColors extends ThemeExtension<UntravelledTextAreaColors> with DiagnosticableTreeMixin {
  /// TextArea background color.
  final Color backgroundColor;

  /// TextArea active border color.
  final Color activeBorderColor;

  /// TextArea inactive border color.
  final Color inactiveBorderColor;

  /// TextArea error color.
  final Color errorColor;

  /// TextArea hover border color.
  final Color hoverBorderColor;

  /// TextArea text color.
  final Color textColor;

  /// TextArea helper text color.
  final Color helperTextColor;

  const UntravelledTextAreaColors({
    required this.backgroundColor,
    required this.activeBorderColor,
    required this.inactiveBorderColor,
    required this.errorColor,
    required this.hoverBorderColor,
    required this.textColor,
    required this.helperTextColor,
  });

  @override
  UntravelledTextAreaColors copyWith({
    Color? backgroundColor,
    Color? activeBorderColor,
    Color? inactiveBorderColor,
    Color? errorColor,
    Color? hoverBorderColor,
    Color? textColor,
    Color? helperTextColor,
  }) {
    return UntravelledTextAreaColors(
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
  UntravelledTextAreaColors lerp(ThemeExtension<UntravelledTextAreaColors>? other, double t) {
    if (other is! UntravelledTextAreaColors) return this;

    return UntravelledTextAreaColors(
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
      ..add(DiagnosticsProperty("type", "UntravelledTextAreaColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("activeBorderColor", activeBorderColor))
      ..add(ColorProperty("inactiveBorderColor", inactiveBorderColor))
      ..add(ColorProperty("errorColor", errorColor))
      ..add(ColorProperty("hoverBorderColor", hoverBorderColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("helperTextColor", helperTextColor));
  }
}
