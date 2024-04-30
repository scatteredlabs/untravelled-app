import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/checkbox/checkbox_colors.dart';
import 'package:untravelled_app/core/theme/checkbox/checkbox_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCheckboxTheme extends ThemeExtension<UntravelledCheckboxTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Checkbox colors.
  final UntravelledCheckboxColors colors;

  /// Checkbox properties.
  final UntravelledCheckboxProperties properties;

  UntravelledCheckboxTheme({
    required this.tokens,
    UntravelledCheckboxColors? colors,
    UntravelledCheckboxProperties? properties,
  })  : colors = colors ??
            UntravelledCheckboxColors(
              activeColor: tokens.colors.piccolo,
              borderColor: tokens.colors.trunks,
              checkColor: tokens.colors.goten,
              inactiveColor: Colors.transparent,
              textColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            UntravelledCheckboxProperties(
              borderRadius: tokens.borders.interactiveXs,
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledCheckboxTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledCheckboxColors? colors,
    UntravelledCheckboxProperties? properties,
  }) {
    return UntravelledCheckboxTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledCheckboxTheme lerp(ThemeExtension<UntravelledCheckboxTheme>? other, double t) {
    if (other is! UntravelledCheckboxTheme) return this;

    return UntravelledCheckboxTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledCheckboxTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledCheckboxColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledCheckboxProperties>("properties", properties));
  }
}
