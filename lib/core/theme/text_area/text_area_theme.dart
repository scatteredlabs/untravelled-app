import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/text_area/text_area_colors.dart';
import 'package:untravelled_app/core/theme/text_area/text_area_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTextAreaTheme extends ThemeExtension<UntravelledTextAreaTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// TextArea colors.
  final UntravelledTextAreaColors colors;

  /// TextArea properties.
  final UntravelledTextAreaProperties properties;

  UntravelledTextAreaTheme({
    required this.tokens,
    UntravelledTextAreaColors? colors,
    UntravelledTextAreaProperties? properties,
  })  : colors = colors ??
            UntravelledTextAreaColors(
              backgroundColor: tokens.colors.gohan,
              activeBorderColor: tokens.colors.piccolo,
              inactiveBorderColor: tokens.colors.beerus,
              errorColor: tokens.colors.chiChi100,
              hoverBorderColor: tokens.colors.beerus,
              textColor: tokens.colors.textPrimary,
              helperTextColor: tokens.colors.trunks,
            ),
        properties = properties ??
            UntravelledTextAreaProperties(
              borderRadius: tokens.borders.interactiveSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              textPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.text16,
              helperTextStyle: tokens.typography.body.text12,
            );

  @override
  UntravelledTextAreaTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTextAreaColors? colors,
    UntravelledTextAreaProperties? properties,
  }) {
    return UntravelledTextAreaTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledTextAreaTheme lerp(ThemeExtension<UntravelledTextAreaTheme>? other, double t) {
    if (other is! UntravelledTextAreaTheme) return this;

    return UntravelledTextAreaTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledTextAreaTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTextAreaColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTextAreaProperties>("properties", properties));
  }
}
