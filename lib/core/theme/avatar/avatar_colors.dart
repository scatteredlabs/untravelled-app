import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledAvatarColors extends ThemeExtension<UntravelledAvatarColors> with DiagnosticableTreeMixin {
  /// Avatar background color.
  final Color backgroundColor;

  /// Avatar badge color.
  final Color badgeColor;

  /// Avatar icon color.
  final Color iconColor;

  /// Avatar text color.
  final Color textColor;

  const UntravelledAvatarColors({
    required this.backgroundColor,
    required this.badgeColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  UntravelledAvatarColors copyWith({
    Color? backgroundColor,
    Color? badgeColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return UntravelledAvatarColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      badgeColor: badgeColor ?? this.badgeColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  UntravelledAvatarColors lerp(ThemeExtension<UntravelledAvatarColors>? other, double t) {
    if (other is! UntravelledAvatarColors) return this;

    return UntravelledAvatarColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      badgeColor: colorPremulLerp(badgeColor, other.badgeColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAvatarColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("badgeColor", badgeColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
