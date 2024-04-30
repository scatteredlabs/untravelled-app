import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/segmented_control/segmented_control_colors.dart';
import 'package:untravelled_app/core/theme/segmented_control/segmented_control_properties.dart';
import 'package:untravelled_app/core/theme/segmented_control/segmented_control_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledSegmentedControlTheme extends ThemeExtension<UntravelledSegmentedControlTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// SegmentedControl colors.
  final UntravelledSegmentedControlColors colors;

  /// SegmentedControl properties.
  final UntravelledSegmentedControlProperties properties;

  /// SegmentedControl sizes.
  final UntravelledSegmentedControlSizes sizes;

  UntravelledSegmentedControlTheme({
    required this.tokens,
    UntravelledSegmentedControlColors? colors,
    UntravelledSegmentedControlProperties? properties,
    UntravelledSegmentedControlSizes? sizes,
  })  : colors = colors ??
            UntravelledSegmentedControlColors(
              backgroundColor: tokens.colors.goku,
              selectedSegmentColor: tokens.colors.gohan,
              textColor: tokens.colors.textPrimary,
              selectedTextColor: tokens.colors.textPrimary,
            ),
        properties = properties ??
            UntravelledSegmentedControlProperties(
              borderRadius: tokens.borders.interactiveMd,
              gap: tokens.sizes.x5s,
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
              padding: EdgeInsets.all(tokens.sizes.x5s),
            ),
        sizes = sizes ?? UntravelledSegmentedControlSizes(tokens: tokens);

  @override
  UntravelledSegmentedControlTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledSegmentedControlColors? colors,
    UntravelledSegmentedControlProperties? properties,
    UntravelledSegmentedControlSizes? sizes,
  }) {
    return UntravelledSegmentedControlTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledSegmentedControlTheme lerp(ThemeExtension<UntravelledSegmentedControlTheme>? other, double t) {
    if (other is! UntravelledSegmentedControlTheme) return this;

    return UntravelledSegmentedControlTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledSegmentedControlTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlSizes>("sizes", sizes));
  }
}
