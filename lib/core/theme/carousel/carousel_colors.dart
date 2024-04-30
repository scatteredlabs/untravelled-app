import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledCarouselColors extends ThemeExtension<UntravelledCarouselColors> with DiagnosticableTreeMixin {
  /// Default text color of Carousel items.
  final Color textColor;

  /// Carousel item icon color.
  final Color iconColor;

  const UntravelledCarouselColors({
    required this.textColor,
    required this.iconColor,
  });

  @override
  UntravelledCarouselColors copyWith({
    Color? textColor,
    Color? iconColor,
  }) {
    return UntravelledCarouselColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  UntravelledCarouselColors lerp(ThemeExtension<UntravelledCarouselColors>? other, double t) {
    if (other is! UntravelledCarouselColors) return this;

    return UntravelledCarouselColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCarouselColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor));
  }
}
