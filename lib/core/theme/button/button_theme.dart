import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/button/button_colors.dart';
import 'package:untravelled_app/core/theme/button/button_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledButtonTheme extends ThemeExtension<UntravelledButtonTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Button colors.
  final UntravelledButtonColors colors;

  /// Button sizes.
  final UntravelledButtonSizes sizes;

  UntravelledButtonTheme({
    required this.tokens,
    UntravelledButtonColors? colors,
    UntravelledButtonSizes? sizes,
  })  : colors = colors ??
            UntravelledButtonColors(
              borderColor: tokens.colors.trunks,
              textColor: tokens.colors.textPrimary,
              filledVariantBackgroundColor: tokens.colors.piccolo,
              filledVariantTextColor: tokens.colors.goten,
              textVariantTextColor: tokens.colors.textSecondary,
              textVariantFocusColor: tokens.colors.piccolo,
              textVariantHoverColor: tokens.colors.jiren,
            ),
        sizes = sizes ?? UntravelledButtonSizes(tokens: tokens);

  @override
  UntravelledButtonTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledButtonColors? colors,
    UntravelledButtonSizes? sizes,
  }) {
    return UntravelledButtonTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledButtonTheme lerp(ThemeExtension<UntravelledButtonTheme>? other, double t) {
    if (other is! UntravelledButtonTheme) return this;

    return UntravelledButtonTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledButtonTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledButtonColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledButtonSizes>("sizes", sizes));
  }
}
