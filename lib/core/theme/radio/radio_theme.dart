import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/radio/radio_colors.dart';
import 'package:untravelled_app/core/theme/radio/radio_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledRadioTheme extends ThemeExtension<UntravelledRadioTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Radio colors.
  final UntravelledRadioColors colors;

  /// Radio properties.
  final UntravelledRadioProperties properties;

  UntravelledRadioTheme({
    required this.tokens,
    UntravelledRadioColors? colors,
    UntravelledRadioProperties? properties,
  })  : colors = colors ??
            UntravelledRadioColors(
              activeColor: tokens.colors.piccolo,
              inactiveColor: tokens.colors.trunks,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            UntravelledRadioProperties(
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledRadioTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledRadioColors? colors,
    UntravelledRadioProperties? properties,
  }) {
    return UntravelledRadioTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledRadioTheme lerp(ThemeExtension<UntravelledRadioTheme>? other, double t) {
    if (other is! UntravelledRadioTheme) return this;

    return UntravelledRadioTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledRadioTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledRadioColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledRadioProperties>("properties", properties));
  }
}
