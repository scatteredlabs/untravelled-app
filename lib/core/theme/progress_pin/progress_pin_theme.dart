import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress_pin/progress_pin_colors.dart';
import 'package:untravelled_app/core/theme/progress_pin/progress_pin_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledProgressPinTheme extends ThemeExtension<UntravelledProgressPinTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Progress pin colors.
  final UntravelledProgressPinColors colors;

  /// Progress pin properties.
  final UntravelledProgressPinProperties properties;

  UntravelledProgressPinTheme({
    required this.tokens,
    UntravelledProgressPinColors? colors,
    UntravelledProgressPinProperties? properties,
  })  : colors = colors ??
            UntravelledProgressPinColors(
              pinColor: tokens.colors.popo,
              pinBorderColor: tokens.colors.goten,
              thumbColor: tokens.colors.goten,
              shadowColor: tokens.colors.popo,
              textColor: tokens.colors.goten,
            ),
        properties = properties ??
            UntravelledProgressPinProperties(
              pinDistance: 6,
              pinWidth: 36,
              pinBorderWidth: 2,
              thumbWidthMultiplier: 1.5,
              shadowElevation: 6,
              textStyle: tokens.typography.caption.text10.copyWith(letterSpacing: 0.5),
            );

  @override
  UntravelledProgressPinTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledProgressPinColors? colors,
    UntravelledProgressPinProperties? properties,
  }) {
    return UntravelledProgressPinTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledProgressPinTheme lerp(ThemeExtension<UntravelledProgressPinTheme>? other, double t) {
    if (other is! UntravelledProgressPinTheme) return this;

    return UntravelledProgressPinTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledProgressPinTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledProgressPinColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledProgressPinProperties>("properties", properties));
  }
}
