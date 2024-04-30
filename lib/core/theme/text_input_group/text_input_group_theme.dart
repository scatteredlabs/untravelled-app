import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/text_input_group/text_input_group_colors.dart';
import 'package:untravelled_app/core/theme/text_input_group/text_input_group_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTextInputGroupTheme extends ThemeExtension<UntravelledTextInputGroupTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// TextInputGroup colors.
  final UntravelledTextInputGroupColors colors;

  /// TextInputGroup properties.
  final UntravelledTextInputGroupProperties properties;

  UntravelledTextInputGroupTheme({
    required this.tokens,
    UntravelledTextInputGroupColors? colors,
    UntravelledTextInputGroupProperties? properties,
  })  : colors = colors ??
            UntravelledTextInputGroupColors(
              backgroundColor: tokens.colors.gohan,
              errorColor: tokens.colors.chiChi100,
              helperTextColor: tokens.colors.trunks,
              borderColor: tokens.colors.beerus,
              hoverBorderColor: tokens.colors.beerus,
            ),
        properties = properties ??
            UntravelledTextInputGroupProperties(
              borderRadius: tokens.borders.interactiveSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              textPadding: EdgeInsets.all(tokens.sizes.x2s),
              textStyle: tokens.typography.body.text16,
              helperTextStyle: tokens.typography.body.text12,
            );

  @override
  UntravelledTextInputGroupTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTextInputGroupColors? colors,
    UntravelledTextInputGroupProperties? properties,
  }) {
    return UntravelledTextInputGroupTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledTextInputGroupTheme lerp(ThemeExtension<UntravelledTextInputGroupTheme>? other, double t) {
    if (other is! UntravelledTextInputGroupTheme) return this;

    return UntravelledTextInputGroupTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputGroupTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTextInputGroupColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTextInputGroupProperties>("properties", properties));
  }
}
