import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tab_bar/tab_bar_colors.dart';
import 'package:untravelled_app/core/theme/tab_bar/tab_bar_properties.dart';
import 'package:untravelled_app/core/theme/tab_bar/tab_bar_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTabBarTheme extends ThemeExtension<UntravelledTabBarTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// TabBar colors.
  final UntravelledTabBarColors colors;

  /// TabBar properties.
  final UntravelledTabBarProperties properties;

  /// TabBar sizes.
  final UntravelledTabBarSizes sizes;

  UntravelledTabBarTheme({
    required this.tokens,
    UntravelledTabBarColors? colors,
    UntravelledTabBarProperties? properties,
    UntravelledTabBarSizes? sizes,
  })  : colors = colors ??
            UntravelledTabBarColors(
              indicatorColor: tokens.colors.piccolo,
              textColor: tokens.colors.textPrimary,
              selectedTextColor: tokens.colors.piccolo,
              selectedPillTextColor: tokens.colors.textPrimary,
              selectedPillTabColor: tokens.colors.gohan,
            ),
        properties = properties ??
            UntravelledTabBarProperties(
              gap: tokens.sizes.x5s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        sizes = sizes ?? UntravelledTabBarSizes(tokens: tokens);

  @override
  UntravelledTabBarTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTabBarColors? colors,
    UntravelledTabBarProperties? properties,
    UntravelledTabBarSizes? sizes,
  }) {
    return UntravelledTabBarTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledTabBarTheme lerp(ThemeExtension<UntravelledTabBarTheme>? other, double t) {
    if (other is! UntravelledTabBarTheme) return this;

    return UntravelledTabBarTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledTabBarTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTabBarColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTabBarProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledTabBarSizes>("sizes", sizes));
  }
}
