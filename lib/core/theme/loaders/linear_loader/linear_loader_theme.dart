import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/linear_loader/linear_loader_colors.dart';
import 'package:untravelled_app/core/theme/loaders/linear_loader/linear_loader_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledLinearLoaderTheme extends ThemeExtension<UntravelledLinearLoaderTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Circular loader colors.
  final UntravelledLinearLoaderColors colors;

  /// Circular loader sizes.
  final UntravelledLinearLoaderSizes sizes;

  UntravelledLinearLoaderTheme({
    required this.tokens,
    UntravelledLinearLoaderColors? colors,
    UntravelledLinearLoaderSizes? sizes,
  })  : colors = colors ??
            UntravelledLinearLoaderColors(
              color: tokens.colors.hit,
              backgroundColor: Colors.transparent,
            ),
        sizes = sizes ?? UntravelledLinearLoaderSizes(tokens: tokens);

  @override
  UntravelledLinearLoaderTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledLinearLoaderColors? colors,
    UntravelledLinearLoaderSizes? sizes,
  }) {
    return UntravelledLinearLoaderTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledLinearLoaderTheme lerp(ThemeExtension<UntravelledLinearLoaderTheme>? other, double t) {
    if (other is! UntravelledLinearLoaderTheme) return this;

    return UntravelledLinearLoaderTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearLoaderTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizes>("sizes", sizes));
  }
}
