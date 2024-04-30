import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTagColors extends ThemeExtension<UntravelledTagColors> with DiagnosticableTreeMixin {
  /// Tag text color.
  final Color textColor;

  /// Tag icon color.
  final Color iconColor;

  /// Tag background color.
  final Color backgroundColor;

  const UntravelledTagColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  UntravelledTagColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return UntravelledTagColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledTagColors lerp(ThemeExtension<UntravelledTagColors>? other, double t) {
    if (other is! UntravelledTagColors) return this;

    return UntravelledTagColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTagColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
