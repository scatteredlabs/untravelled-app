import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/accordion/accordion_colors.dart';
import 'package:untravelled_app/core/theme/accordion/accordion_properties.dart';
import 'package:untravelled_app/core/theme/accordion/accordion_shadows.dart';
import 'package:untravelled_app/core/theme/accordion/accordion_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAccordionTheme extends ThemeExtension<UntravelledAccordionTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Accordion colors.
  final UntravelledAccordionColors colors;

  /// Accordion properties.
  final UntravelledAccordionProperties properties;

  /// Accordion shadows.
  final UntravelledAccordionShadows shadows;

  /// Accordion sizes.
  final UntravelledAccordionSizes sizes;

  UntravelledAccordionTheme({
    required this.tokens,
    UntravelledAccordionColors? colors,
    UntravelledAccordionProperties? properties,
    UntravelledAccordionShadows? shadows,
    UntravelledAccordionSizes? sizes,
  })  : colors = colors ??
            UntravelledAccordionColors(
              textColor: tokens.colors.textPrimary,
              expandedTextColor: tokens.colors.textPrimary,
              contentColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              expandedIconColor: tokens.colors.iconPrimary,
              trailingIconColor: tokens.colors.iconPrimary,
              expandedTrailingIconColor: tokens.colors.iconSecondary,
              backgroundColor: tokens.colors.gohan,
              expandedBackgroundColor: tokens.colors.gohan,
              borderColor: tokens.colors.beerus,
              dividerColor: tokens.colors.beerus,
            ),
        properties = properties ??
            UntravelledAccordionProperties(
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        shadows = shadows ?? UntravelledAccordionShadows(shadows: tokens.shadows.sm),
        sizes = sizes ?? UntravelledAccordionSizes(tokens: tokens);

  @override
  UntravelledAccordionTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledAccordionColors? colors,
    UntravelledAccordionProperties? properties,
    UntravelledAccordionShadows? shadows,
    UntravelledAccordionSizes? sizes,
  }) {
    return UntravelledAccordionTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledAccordionTheme lerp(ThemeExtension<UntravelledAccordionTheme>? other, double t) {
    if (other is! UntravelledAccordionTheme) return this;

    return UntravelledAccordionTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledAccordionTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAccordionColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledAccordionProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledAccordionShadows>("shadows", shadows))
      ..add(DiagnosticsProperty<UntravelledAccordionSizes>("sizes", sizes));
  }
}
