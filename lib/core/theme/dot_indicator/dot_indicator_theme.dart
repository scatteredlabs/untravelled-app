import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/dot_indicator/dot_indicator_colors.dart';
import 'package:untravelled_app/core/theme/dot_indicator/dot_indicator_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledDotIndicatorTheme extends ThemeExtension<UntravelledDotIndicatorTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// DotIndicator colors.
  final UntravelledDotIndicatorColors colors;

  /// DotIndicator properties.
  final UntravelledDotIndicatorProperties properties;

  UntravelledDotIndicatorTheme({
    required this.tokens,
    UntravelledDotIndicatorColors? colors,
    UntravelledDotIndicatorProperties? properties,
  })  : colors = colors ??
            UntravelledDotIndicatorColors(
              selectedColor: tokens.colors.piccolo,
              unselectedColor: tokens.colors.beerus,
            ),
        properties = properties ??
            UntravelledDotIndicatorProperties(
              gap: tokens.sizes.x4s,
              size: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            );

  @override
  UntravelledDotIndicatorTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledDotIndicatorColors? colors,
    UntravelledDotIndicatorProperties? properties,
  }) {
    return UntravelledDotIndicatorTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledDotIndicatorTheme lerp(ThemeExtension<UntravelledDotIndicatorTheme>? other, double t) {
    if (other is! UntravelledDotIndicatorTheme) return this;

    return UntravelledDotIndicatorTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledDotIndicatorTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledDotIndicatorColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledDotIndicatorProperties>("properties", properties));
  }
}
