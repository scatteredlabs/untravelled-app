import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tokens/borders.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/opacities.dart';
import 'package:untravelled_app/core/theme/tokens/shadows.dart';
import 'package:untravelled_app/core/theme/tokens/sizes.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';

@immutable
class UntravelledTokens extends ThemeExtension<UntravelledTokens> with DiagnosticableTreeMixin {
  static const light = UntravelledTokens(
    borders: UntravelledBorders.borders,
    colors: UntravelledColors.light,
    complementaryColors: UntravelledColors.dark,
    opacities: UntravelledOpacities.opacities,
    shadows: UntravelledShadows.light,
    sizes: UntravelledSizes.sizes,
    transitions: UntravelledTransitions.transitions,
    typography: UntravelledTypography.typography,
  );

  static const dark = UntravelledTokens(
    borders: UntravelledBorders.borders,
    colors: UntravelledColors.dark,
    complementaryColors: UntravelledColors.light,
    opacities: UntravelledOpacities.opacities,
    shadows: UntravelledShadows.dark,
    sizes: UntravelledSizes.sizes,
    transitions: UntravelledTransitions.transitions,
    typography: UntravelledTypography.typography,
  );

  /// Untravelled Design System borders.
  final UntravelledBorders borders;

  /// Untravelled Design System colors.
  final UntravelledColors colors;

  /// Untravelled Design System colors that are from complementary theme (light -> dark, dark -> light).
  final UntravelledColors complementaryColors;

  /// Untravelled Design System opacities.
  final UntravelledOpacities opacities;

  /// Untravelled Design System shadows.
  final UntravelledShadows shadows;

  /// Untravelled Design System sizes.
  final UntravelledSizes sizes;

  final UntravelledTransitions transitions;

  /// Untravelled Design System typography.
  final UntravelledTypography typography;

  const UntravelledTokens({
    required this.borders,
    required this.colors,
    required this.complementaryColors,
    required this.opacities,
    required this.shadows,
    required this.sizes,
    required this.transitions,
    required this.typography,
  });

  @override
  UntravelledTokens copyWith({
    UntravelledBorders? borders,
    UntravelledColors? colors,
    UntravelledColors? complementaryColors,
    UntravelledOpacities? opacities,
    UntravelledShadows? shadows,
    UntravelledSizes? sizes,
    UntravelledTransitions? transitions,
    UntravelledTypography? typography,
  }) {
    return UntravelledTokens(
      borders: borders ?? this.borders,
      colors: colors ?? this.colors,
      complementaryColors: complementaryColors ?? this.complementaryColors,
      opacities: opacities ?? this.opacities,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
      transitions: transitions ?? this.transitions,
      typography: typography ?? this.typography,
    );
  }

  @override
  UntravelledTokens lerp(ThemeExtension<UntravelledTokens>? other, double t) {
    if (other is! UntravelledTokens) return this;

    return UntravelledTokens(
      borders: borders.lerp(other.borders, t),
      colors: colors.lerp(other.colors, t),
      complementaryColors: complementaryColors.lerp(other.complementaryColors, t),
      opacities: opacities.lerp(other.opacities, t),
      shadows: shadows.lerp(other.shadows, t),
      sizes: sizes.lerp(other.sizes, t),
      transitions: transitions.lerp(other.transitions, t),
      typography: typography.lerp(other.typography, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTokens"))
      ..add(DiagnosticsProperty<UntravelledBorders>("UntravelledBorders", borders))
      ..add(DiagnosticsProperty<UntravelledColors>("UntravelledColors", colors))
      ..add(DiagnosticsProperty<UntravelledColors>("UntravelledColors", complementaryColors))
      ..add(DiagnosticsProperty<UntravelledOpacities>("UntravelledOpacities", opacities))
      ..add(DiagnosticsProperty<UntravelledShadows>("UntravelledShadows", shadows))
      ..add(DiagnosticsProperty<UntravelledSizes>("UntravelledSizes", sizes))
      ..add(DiagnosticsProperty<UntravelledTransitions>("UntravelledTransitions", transitions))
      ..add(DiagnosticsProperty<UntravelledTypography>("UntravelledTypography", typography));
  }
}
