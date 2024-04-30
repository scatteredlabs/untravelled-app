import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/linear_progress/linear_progress_colors.dart';
import 'package:untravelled_app/core/theme/progress/linear_progress/linear_progress_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledLinearProgressTheme extends ThemeExtension<UntravelledLinearProgressTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Linear progress colors.
  final UntravelledLinearProgressColors colors;

  /// Linear progress sizes.
  final UntravelledLinearProgressSizes sizes;

  UntravelledLinearProgressTheme({
    required this.tokens,
    UntravelledLinearProgressColors? colors,
    UntravelledLinearProgressSizes? sizes,
  })  : colors = colors ??
            UntravelledLinearProgressColors(
              color: tokens.colors.piccolo,
              backgroundColor: tokens.colors.beerus,
            ),
        sizes = sizes ?? UntravelledLinearProgressSizes(tokens: tokens);

  @override
  UntravelledLinearProgressTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledLinearProgressColors? colors,
    UntravelledLinearProgressSizes? sizes,
  }) {
    return UntravelledLinearProgressTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledLinearProgressTheme lerp(ThemeExtension<UntravelledLinearProgressTheme>? other, double t) {
    if (other is! UntravelledLinearProgressTheme) return this;

    return UntravelledLinearProgressTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearProgressTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledLinearProgressColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizes>("sizes", sizes));
  }
}
