import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/theme/tooltip/tooltip_colors.dart';
import 'package:untravelled_app/core/theme/tooltip/tooltip_properties.dart';
import 'package:untravelled_app/core/theme/tooltip/tooltip_shadows.dart';

@immutable
class UntravelledTooltipTheme extends ThemeExtension<UntravelledTooltipTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Tooltip colors.
  final UntravelledTooltipColors colors;

  /// Tooltip properties.
  final UntravelledTooltipProperties properties;

  /// Tooltip shadows.
  final UntravelledTooltipShadows shadows;

  UntravelledTooltipTheme({
    required this.tokens,
    UntravelledTooltipColors? colors,
    UntravelledTooltipProperties? properties,
    UntravelledTooltipShadows? shadows,
  })  : colors = colors ??
            UntravelledTooltipColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
            ),
        properties = properties ??
            UntravelledTooltipProperties(
              borderRadius: tokens.borders.interactiveXs,
              arrowBaseWidth: tokens.sizes.x2s,
              arrowLength: tokens.sizes.x4s,
              arrowTipDistance: tokens.sizes.x4s,
              transitionDuration: const Duration(milliseconds: 150),
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x3s),
              textStyle: tokens.typography.body.text12,
            ),
        shadows = shadows ?? UntravelledTooltipShadows(tooltipShadows: tokens.shadows.sm);

  @override
  UntravelledTooltipTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTooltipColors? colors,
    UntravelledTooltipProperties? properties,
    UntravelledTooltipShadows? shadows,
  }) {
    return UntravelledTooltipTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  UntravelledTooltipTheme lerp(ThemeExtension<UntravelledTooltipTheme>? other, double t) {
    if (other is! UntravelledTooltipTheme) return this;

    return UntravelledTooltipTheme(
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
      ..add(DiagnosticsProperty("type", "UntravelledTooltipTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTooltipColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTooltipProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledTooltipShadows>("shadows", shadows));
  }
}
