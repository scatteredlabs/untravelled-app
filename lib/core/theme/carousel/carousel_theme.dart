import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/carousel/carousel_colors.dart';
import 'package:untravelled_app/core/theme/carousel/carousel_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCarouselTheme extends ThemeExtension<UntravelledCarouselTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Carousel colors.
  final UntravelledCarouselColors colors;

  /// Carousel properties.
  final UntravelledCarouselProperties properties;

  UntravelledCarouselTheme({
    required this.tokens,
    UntravelledCarouselColors? colors,
    UntravelledCarouselProperties? properties,
  })  : colors = colors ??
            UntravelledCarouselColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
            ),
        properties = properties ??
            UntravelledCarouselProperties(
              gap: tokens.sizes.x2s,
              textStyle: tokens.typography.body.textDefault,
              autoPlayDelay: const Duration(seconds: 3),
              transitionDuration: const Duration(milliseconds: 800),
              transitionCurve: Curves.fastOutSlowIn,
            );

  @override
  UntravelledCarouselTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledCarouselColors? colors,
    UntravelledCarouselProperties? properties,
  }) {
    return UntravelledCarouselTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledCarouselTheme lerp(ThemeExtension<UntravelledCarouselTheme>? other, double t) {
    if (other is! UntravelledCarouselTheme) return this;

    return UntravelledCarouselTheme(
      tokens: tokens,
      properties: properties.lerp(other.properties, t),
      colors: colors.lerp(other.colors, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledCarouselTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledCarouselColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledCarouselProperties>("properties", properties));
  }
}
