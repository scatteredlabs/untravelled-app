import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/toast/toast_colors.dart';
import 'package:untravelled_app/core/theme/toast/toast_properties.dart';
import 'package:untravelled_app/core/theme/toast/toast_shadows.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledToastTheme extends ThemeExtension<UntravelledToastTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Toast colors.
  final UntravelledToastColors colors;

  /// Toast properties.
  final UntravelledToastProperties properties;

  /// Toast shadows.
  final UntravelledToastShadows shadows;

  UntravelledToastTheme({
    required this.tokens,
    UntravelledToastColors? colors,
    UntravelledToastProperties? properties,
    UntravelledToastShadows? shadows,
  })  : colors = colors ??
            UntravelledToastColors(
              lightVariantBackgroundColor: tokens.colors.gohan,
              darkVariantBackgroundColor: tokens.complementaryColors.gohan,
              lightVariantTextColor: tokens.colors.bulma,
              darkVariantTextColor: tokens.complementaryColors.bulma,
              lightVariantIconColor: tokens.colors.bulma,
              darkVariantIconColor: tokens.complementaryColors.bulma,
            ),
        properties = properties ??
            UntravelledToastProperties(
              borderRadius: tokens.borders.surfaceSm,
              gap: tokens.sizes.x2s,
              displayDuration: const Duration(seconds: 3),
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows = shadows ?? UntravelledToastShadows(toastShadows: tokens.shadows.lg);

  @override
  UntravelledToastTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledToastColors? colors,
    UntravelledToastProperties? properties,
    UntravelledToastShadows? shadows,
  }) {
    return UntravelledToastTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  UntravelledToastTheme lerp(ThemeExtension<UntravelledToastTheme>? other, double t) {
    if (other is! UntravelledToastTheme) return this;

    return UntravelledToastTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      shadows: shadows.lerp(other.shadows, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledToastTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledToastColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledToastProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledToastShadows>("shadows", shadows));
  }
}
