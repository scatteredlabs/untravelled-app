import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/popover/popover_colors.dart';
import 'package:untravelled_app/core/theme/popover/popover_properties.dart';
import 'package:untravelled_app/core/theme/popover/popover_shadows.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledPopoverTheme extends ThemeExtension<UntravelledPopoverTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Popover colors.
  final UntravelledPopoverColors colors;

  /// Popover properties.
  final UntravelledPopoverProperties properties;

  /// Popover shadows.
  final UntravelledPopoverShadows shadows;

  UntravelledPopoverTheme({
    required this.tokens,
    UntravelledPopoverColors? colors,
    UntravelledPopoverProperties? properties,
    UntravelledPopoverShadows? shadows,
  })  : colors = colors ??
            UntravelledPopoverColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
            ),
        properties = properties ??
            UntravelledPopoverProperties(
              borderRadius: tokens.borders.interactiveMd,
              distanceToTarget: tokens.sizes.x4s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              contentPadding: EdgeInsets.all(tokens.sizes.x3s),
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows = shadows ?? UntravelledPopoverShadows(popoverShadows: tokens.shadows.sm);

  @override
  UntravelledPopoverTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledPopoverColors? colors,
    UntravelledPopoverProperties? properties,
    UntravelledPopoverShadows? shadows,
  }) {
    return UntravelledPopoverTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  UntravelledPopoverTheme lerp(ThemeExtension<UntravelledPopoverTheme>? other, double t) {
    if (other is! UntravelledPopoverTheme) return this;

    return UntravelledPopoverTheme(
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
      ..add(DiagnosticsProperty("type", "UntravelledPopoverTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledPopoverColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledPopoverProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledPopoverShadows>("shadows", shadows));
  }
}
