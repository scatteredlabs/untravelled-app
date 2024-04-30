import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTooltipColors extends ThemeExtension<UntravelledTooltipColors> with DiagnosticableTreeMixin {
  /// Tooltip text color.
  final Color textColor;

  /// Tooltip icon color.
  final Color iconColor;

  /// Tooltip background color.
  final Color backgroundColor;

  const UntravelledTooltipColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  UntravelledTooltipColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return UntravelledTooltipColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledTooltipColors lerp(ThemeExtension<UntravelledTooltipColors>? other, double t) {
    if (other is! UntravelledTooltipColors) return this;

    return UntravelledTooltipColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTooltipColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
