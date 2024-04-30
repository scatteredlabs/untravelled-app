import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untravelled_app/core/theme/menu_item/menu_item_colors.dart';
import 'package:untravelled_app/core/theme/menu_item/menu_item_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledMenuItemTheme extends ThemeExtension<UntravelledMenuItemTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// MenuItem colors.
  final UntravelledMenuItemColors colors;

  /// MenuItem properties.
  final UntravelledMenuItemProperties properties;

  UntravelledMenuItemTheme({
    required this.tokens,
    UntravelledMenuItemColors? colors,
    UntravelledMenuItemProperties? properties,
  })  : colors = colors ??
            UntravelledMenuItemColors(
              backgroundColor: Colors.transparent,
              dividerColor: tokens.colors.beerus,
              iconColor: tokens.colors.iconPrimary,
              titleTextColor: tokens.colors.textPrimary,
              descriptionTextColor: tokens.colors.textSecondary,
            ),
        properties = properties ??
            UntravelledMenuItemProperties(
              borderRadius: tokens.borders.interactiveSm,
              verticalGap: tokens.sizes.x5s,
              minimumHeight: tokens.sizes.md,
              padding: EdgeInsets.all(tokens.sizes.x3s),
              titleTextStyle: tokens.typography.body.textDefault,
              descriptionTextStyle: tokens.typography.body.text12,
            );

  @override
  UntravelledMenuItemTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledMenuItemColors? colors,
    UntravelledMenuItemProperties? properties,
  }) {
    return UntravelledMenuItemTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledMenuItemTheme lerp(ThemeExtension<UntravelledMenuItemTheme>? other, double t) {
    if (other is! UntravelledMenuItemTheme) return this;

    return UntravelledMenuItemTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledMenuItemTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledMenuItemColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledMenuItemProperties>("properties", properties));
  }
}
