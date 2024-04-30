import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/circular_loader/circular_loader_colors.dart';
import 'package:untravelled_app/core/theme/loaders/circular_loader/circular_loader_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCircularLoaderTheme extends ThemeExtension<UntravelledCircularLoaderTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Circular loader colors.
  final UntravelledCircularLoaderColors colors;

  /// Circular loader sizes.
  final UntravelledCircularLoaderSizes sizes;

  UntravelledCircularLoaderTheme({
    required this.tokens,
    UntravelledCircularLoaderColors? colors,
    UntravelledCircularLoaderSizes? sizes,
  })  : colors = colors ??
            UntravelledCircularLoaderColors(
              color: tokens.colors.hit,
              backgroundColor: Colors.transparent,
            ),
        sizes = sizes ?? UntravelledCircularLoaderSizes(tokens: tokens);

  @override
  UntravelledCircularLoaderTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledCircularLoaderColors? colors,
    UntravelledCircularLoaderSizes? sizes,
  }) {
    return UntravelledCircularLoaderTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledCircularLoaderTheme lerp(ThemeExtension<UntravelledCircularLoaderTheme>? other, double t) {
    if (other is! UntravelledCircularLoaderTheme) return this;

    return UntravelledCircularLoaderTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularLoaderTheme"))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizes>("sizes", sizes));
  }
}
