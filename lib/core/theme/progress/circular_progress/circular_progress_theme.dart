import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/circular_progress/circular_progress_colors.dart';
import 'package:untravelled_app/core/theme/progress/circular_progress/circular_progress_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCircularProgressTheme extends ThemeExtension<UntravelledCircularProgressTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Circular progress colors.
  final UntravelledCircularProgressColors colors;

  /// Circular progress sizes.
  final UntravelledCircularProgressSizes sizes;

  UntravelledCircularProgressTheme({
    required this.tokens,
    UntravelledCircularProgressColors? colors,
    UntravelledCircularProgressSizes? sizes,
  })  : colors = colors ??
            UntravelledCircularProgressColors(
              color: tokens.colors.piccolo,
              backgroundColor: tokens.colors.beerus,
            ),
        sizes = sizes ?? UntravelledCircularProgressSizes(tokens: tokens);

  @override
  UntravelledCircularProgressTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledCircularProgressColors? colors,
    UntravelledCircularProgressSizes? sizes,
  }) {
    return UntravelledCircularProgressTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledCircularProgressTheme lerp(ThemeExtension<UntravelledCircularProgressTheme>? other, double t) {
    if (other is! UntravelledCircularProgressTheme) return this;

    return UntravelledCircularProgressTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularProgressTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledCircularProgressColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizes>("sizes", sizes));
  }
}
