import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledPopoverColors extends ThemeExtension<UntravelledPopoverColors> with DiagnosticableTreeMixin {
  /// Popover text color.
  final Color textColor;

  /// Popover icon color.
  final Color iconColor;

  /// Popover background color.
  final Color backgroundColor;

  const UntravelledPopoverColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  UntravelledPopoverColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
  }) {
    return UntravelledPopoverColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  UntravelledPopoverColors lerp(ThemeExtension<UntravelledPopoverColors>? other, double t) {
    if (other is! UntravelledPopoverColors) return this;

    return UntravelledPopoverColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledPopoverColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor));
  }
}
