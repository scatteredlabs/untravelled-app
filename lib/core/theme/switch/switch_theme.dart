import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/switch/switch_colors.dart';
import 'package:untravelled_app/core/theme/switch/switch_properties.dart';
import 'package:untravelled_app/core/theme/switch/switch_shadows.dart';
import 'package:untravelled_app/core/theme/switch/switch_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledSwitchTheme extends ThemeExtension<UntravelledSwitchTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Switch colors.
  final UntravelledSwitchColors colors;

  /// Switch properties.
  final UntravelledSwitchProperties properties;

  /// Switch shadows.
  final UntravelledSwitchShadows shadows;

  /// Switch sizes.
  final UntravelledSwitchSizes sizes;

  UntravelledSwitchTheme({
    required this.tokens,
    UntravelledSwitchColors? colors,
    UntravelledSwitchProperties? properties,
    UntravelledSwitchShadows? shadows,
    UntravelledSwitchSizes? sizes,
  })  : colors = colors ??
            UntravelledSwitchColors(
              activeTrackColor: tokens.colors.piccolo,
              inactiveTrackColor: tokens.colors.beerus,
              activeTextColor: tokens.colors.goten,
              inactiveTextColor: tokens.colors.bulma,
              activeIconColor: tokens.colors.goten,
              inactiveIconColor: tokens.colors.bulma,
              thumbIconColor: tokens.colors.popo,
              thumbColor: tokens.colors.goten,
            ),
        properties = properties ??
            UntravelledSwitchProperties(
              transitionDuration: tokens.transitions.defaultTransitionDuration,
              transitionCurve: tokens.transitions.defaultTransitionCurve,
            ),
        shadows = shadows ??
            UntravelledSwitchShadows(
              thumbShadows: tokens.shadows.sm,
            ),
        sizes = sizes ?? UntravelledSwitchSizes(tokens: tokens);

  @override
  UntravelledSwitchTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledSwitchColors? colors,
    UntravelledSwitchProperties? properties,
    UntravelledSwitchShadows? shadows,
    UntravelledSwitchSizes? sizes,
  }) {
    return UntravelledSwitchTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledSwitchTheme lerp(ThemeExtension<UntravelledSwitchTheme>? other, double t) {
    if (other is! UntravelledSwitchTheme) return this;

    return UntravelledSwitchTheme(
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
      ..add(DiagnosticsProperty("type", "UntravelledSwitchTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledSwitchColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledSwitchProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledSwitchShadows>("shadows", shadows))
      ..add(DiagnosticsProperty<UntravelledSwitchSizes>("sizes", sizes));
  }
}
