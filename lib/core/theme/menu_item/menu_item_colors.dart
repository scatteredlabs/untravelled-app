import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledMenuItemColors extends ThemeExtension<UntravelledMenuItemColors> with DiagnosticableTreeMixin {
  /// MenuItem background color.
  final Color backgroundColor;

  /// MenuItem divider color.
  final Color dividerColor;

  /// MenuItem icon color.
  final Color iconColor;

  /// MenuItem title text color.
  final Color titleTextColor;

  /// MenuItem description text color.
  final Color descriptionTextColor;

  const UntravelledMenuItemColors({
    required this.backgroundColor,
    required this.dividerColor,
    required this.iconColor,
    required this.titleTextColor,
    required this.descriptionTextColor,
  });

  @override
  UntravelledMenuItemColors copyWith({
    Color? backgroundColor,
    Color? dividerColor,
    Color? iconColor,
    Color? titleTextColor,
    Color? descriptionTextColor,
  }) {
    return UntravelledMenuItemColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      iconColor: iconColor ?? this.iconColor,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      descriptionTextColor: descriptionTextColor ?? this.descriptionTextColor,
    );
  }

  @override
  UntravelledMenuItemColors lerp(ThemeExtension<UntravelledMenuItemColors>? other, double t) {
    if (other is! UntravelledMenuItemColors) return this;

    return UntravelledMenuItemColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      dividerColor: colorPremulLerp(dividerColor, other.dividerColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      titleTextColor: colorPremulLerp(titleTextColor, other.titleTextColor, t)!,
      descriptionTextColor: colorPremulLerp(descriptionTextColor, other.descriptionTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledMenuItemColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("dividerColor", dividerColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("titleTextColor", titleTextColor))
      ..add(ColorProperty("descriptionTextColor", descriptionTextColor));
  }
}
