import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/modal/modal_colors.dart';
import 'package:untravelled_app/core/theme/modal/modal_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledModalTheme extends ThemeExtension<UntravelledModalTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Modal colors.
  final UntravelledModalColors colors;

  /// Modal properties.
  final UntravelledModalProperties properties;

  UntravelledModalTheme({
    required this.tokens,
    UntravelledModalColors? colors,
    UntravelledModalProperties? properties,
  })  : colors = colors ??
            UntravelledModalColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
              barrierColor: tokens.colors.zeno,
            ),
        properties = properties ??
            UntravelledModalProperties(
              borderRadius: tokens.borders.surfaceSm,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledModalTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledModalColors? colors,
    UntravelledModalProperties? properties,
  }) {
    return UntravelledModalTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledModalTheme lerp(ThemeExtension<UntravelledModalTheme>? other, double t) {
    if (other is! UntravelledModalTheme) return this;

    return UntravelledModalTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledModalTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledModalColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledModalProperties>("properties", properties));
  }
}
