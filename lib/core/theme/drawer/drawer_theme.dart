import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/drawer/drawer_colors.dart';
import 'package:untravelled_app/core/theme/drawer/drawer_properties.dart';
import 'package:untravelled_app/core/theme/drawer/drawer_shadows.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledDrawerTheme extends ThemeExtension<UntravelledDrawerTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Drawer colors.
  final UntravelledDrawerColors colors;

  /// Drawer properties.
  final UntravelledDrawerProperties properties;

  /// Drawer shadows.
  final UntravelledDrawerShadows shadows;

  UntravelledDrawerTheme({
    required this.tokens,
    UntravelledDrawerColors? colors,
    UntravelledDrawerProperties? properties,
    UntravelledDrawerShadows? shadows,
  })  : colors = colors ??
            UntravelledDrawerColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
              barrierColor: tokens.colors.zeno,
            ),
        properties = properties ??
            UntravelledDrawerProperties(
              borderRadius: BorderRadius.zero,
              width: 448,
              textStyle: tokens.typography.body.textDefault,
            ),
        shadows = shadows ?? UntravelledDrawerShadows(drawerShadows: tokens.shadows.lg);

  @override
  UntravelledDrawerTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledDrawerColors? colors,
    UntravelledDrawerProperties? properties,
    UntravelledDrawerShadows? shadows,
  }) {
    return UntravelledDrawerTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  UntravelledDrawerTheme lerp(ThemeExtension<UntravelledDrawerTheme>? other, double t) {
    if (other is! UntravelledDrawerTheme) return this;

    return UntravelledDrawerTheme(
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
      ..add(DiagnosticsProperty("type", "UntravelledDrawerTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledDrawerColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledDrawerProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledDrawerShadows>("shadows", shadows));
  }
}
