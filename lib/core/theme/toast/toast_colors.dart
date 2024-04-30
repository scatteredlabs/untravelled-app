import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledToastColors extends ThemeExtension<UntravelledToastColors> with DiagnosticableTreeMixin {
  /// Toast light variant background color.
  final Color lightVariantBackgroundColor;

  /// Toast dark variant background color.
  final Color darkVariantBackgroundColor;

  /// Toast light variant text color.
  final Color lightVariantTextColor;

  /// Toast dark variant text color.
  final Color darkVariantTextColor;

  /// Toast light variant icon color.
  final Color lightVariantIconColor;

  /// Toast dark variant icon color.
  final Color darkVariantIconColor;

  const UntravelledToastColors({
    required this.lightVariantBackgroundColor,
    required this.darkVariantBackgroundColor,
    required this.lightVariantTextColor,
    required this.darkVariantTextColor,
    required this.lightVariantIconColor,
    required this.darkVariantIconColor,
  });

  @override
  UntravelledToastColors copyWith({
    Color? lightVariantBackgroundColor,
    Color? darkVariantBackgroundColor,
    Color? lightVariantTextColor,
    Color? darkVariantTextColor,
    Color? lightVariantIconColor,
    Color? darkVariantIconColor,
  }) {
    return UntravelledToastColors(
      lightVariantBackgroundColor: lightVariantBackgroundColor ?? this.lightVariantBackgroundColor,
      darkVariantBackgroundColor: darkVariantBackgroundColor ?? this.darkVariantBackgroundColor,
      lightVariantTextColor: lightVariantTextColor ?? this.lightVariantTextColor,
      darkVariantTextColor: darkVariantTextColor ?? this.darkVariantTextColor,
      lightVariantIconColor: lightVariantIconColor ?? this.lightVariantIconColor,
      darkVariantIconColor: darkVariantIconColor ?? this.darkVariantIconColor,
    );
  }

  @override
  UntravelledToastColors lerp(ThemeExtension<UntravelledToastColors>? other, double t) {
    if (other is! UntravelledToastColors) return this;

    return UntravelledToastColors(
      lightVariantBackgroundColor: colorPremulLerp(lightVariantBackgroundColor, other.lightVariantBackgroundColor, t)!,
      darkVariantBackgroundColor: colorPremulLerp(darkVariantBackgroundColor, other.darkVariantBackgroundColor, t)!,
      lightVariantTextColor: colorPremulLerp(lightVariantTextColor, other.lightVariantTextColor, t)!,
      darkVariantTextColor: colorPremulLerp(darkVariantTextColor, other.darkVariantTextColor, t)!,
      lightVariantIconColor: colorPremulLerp(lightVariantIconColor, other.lightVariantIconColor, t)!,
      darkVariantIconColor: colorPremulLerp(darkVariantIconColor, other.darkVariantIconColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledToastColors"))
      ..add(ColorProperty("lightVariantBackgroundColor", lightVariantBackgroundColor))
      ..add(ColorProperty("darkVariantBackgroundColor", darkVariantBackgroundColor))
      ..add(ColorProperty("lightVariantTextColor", lightVariantTextColor))
      ..add(ColorProperty("darkVariantTextColor", darkVariantTextColor))
      ..add(ColorProperty("lightVariantIconColor", lightVariantIconColor))
      ..add(ColorProperty("darkVariantIconColor", darkVariantIconColor));
  }
}
