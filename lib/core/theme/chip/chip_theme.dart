import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/chip/chip_colors.dart';
import 'package:untravelled_app/core/theme/chip/chip_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledChipTheme extends ThemeExtension<UntravelledChipTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Chip colors.
  final UntravelledChipColors colors;

  /// Chip sizes.
  final UntravelledChipSizes sizes;

  UntravelledChipTheme({
    required this.tokens,
    UntravelledChipColors? colors,
    UntravelledChipSizes? sizes,
  })  : colors = colors ??
            UntravelledChipColors(
              activeColor: tokens.colors.piccolo,
              backgroundColor: tokens.colors.gohan,
              activeBackgroundColor: tokens.colors.jiren,
              textColor: tokens.colors.textPrimary,
            ),
        sizes = sizes ?? UntravelledChipSizes(tokens: tokens);

  @override
  UntravelledChipTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledChipColors? colors,
    UntravelledChipSizes? sizes,
  }) {
    return UntravelledChipTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledChipTheme lerp(ThemeExtension<UntravelledChipTheme>? other, double t) {
    if (other is! UntravelledChipTheme) return this;

    return UntravelledChipTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledChipTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledChipColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledChipSizes>("sizes", sizes));
  }
}
