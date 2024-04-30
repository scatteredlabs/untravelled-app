import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/alert/alert_colors.dart';
import 'package:untravelled_app/core/theme/alert/alert_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAlertTheme extends ThemeExtension<UntravelledAlertTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Alert colors.
  final UntravelledAlertColors colors;

  /// Alert properties.
  final UntravelledAlertProperties properties;

  UntravelledAlertTheme({
    required this.tokens,
    UntravelledAlertColors? colors,
    UntravelledAlertProperties? properties,
  })  : colors = colors ??
            UntravelledAlertColors(
              backgroundColor: tokens.colors.gohan,
              borderColor: tokens.colors.textSecondary,
              iconColor: tokens.colors.iconPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            UntravelledAlertProperties(
              borderRadius: tokens.borders.interactiveSm,
              horizontalGap: tokens.sizes.x3s,
              minimumHeight: tokens.sizes.xl,
              verticalGap: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              padding: EdgeInsets.all(tokens.sizes.x2s),
              bodyTextStyle: tokens.typography.body.textDefault,
              titleTextStyle: tokens.typography.heading.textDefault,
            );

  @override
  UntravelledAlertTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledAlertColors? colors,
    UntravelledAlertProperties? properties,
  }) {
    return UntravelledAlertTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledAlertTheme lerp(ThemeExtension<UntravelledAlertTheme>? other, double t) {
    if (other is! UntravelledAlertTheme) return this;

    return UntravelledAlertTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledAlertTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAlertColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledAlertProperties>("properties", properties));
  }
}
