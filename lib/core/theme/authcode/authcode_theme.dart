import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/authcode/authcode_colors.dart';
import 'package:untravelled_app/core/theme/authcode/authcode_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAuthCodeTheme extends ThemeExtension<UntravelledAuthCodeTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// AuthCode colors.
  final UntravelledAuthCodeColors colors;

  /// AuthCode properties.
  final UntravelledAuthCodeProperties properties;

  UntravelledAuthCodeTheme({
    required this.tokens,
    UntravelledAuthCodeColors? colors,
    UntravelledAuthCodeProperties? properties,
  })  : colors = colors ??
            UntravelledAuthCodeColors(
              selectedBorderColor: tokens.colors.piccolo,
              activeBorderColor: tokens.colors.beerus,
              inactiveBorderColor: tokens.colors.beerus,
              errorBorderColor: tokens.colors.chiChi100,
              selectedFillColor: tokens.colors.gohan,
              activeFillColor: tokens.colors.gohan,
              inactiveFillColor: tokens.colors.gohan,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            UntravelledAuthCodeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.xl,
              width: tokens.sizes.lg,
              animationDuration: tokens.transitions.defaultTransitionDuration,
              errorAnimationDuration: tokens.transitions.defaultTransitionDuration,
              peekDuration: tokens.transitions.defaultTransitionDuration,
              animationCurve: tokens.transitions.defaultTransitionCurve,
              errorAnimationCurve: tokens.transitions.defaultTransitionCurve,
              textStyle: tokens.typography.body.text24,
              errorTextStyle: tokens.typography.body.text12,
            );

  @override
  UntravelledAuthCodeTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledAuthCodeColors? colors,
    UntravelledAuthCodeProperties? properties,
  }) {
    return UntravelledAuthCodeTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledAuthCodeTheme lerp(ThemeExtension<UntravelledAuthCodeTheme>? other, double t) {
    if (other is! UntravelledAuthCodeTheme) return this;

    return UntravelledAuthCodeTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledAuthCodeTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAuthCodeColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledAuthCodeProperties>("properties", properties));
  }
}
