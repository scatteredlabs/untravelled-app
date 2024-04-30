import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tag/tag_colors.dart';
import 'package:untravelled_app/core/theme/tag/tag_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTagTheme extends ThemeExtension<UntravelledTagTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Tag colors.
  final UntravelledTagColors colors;

  /// Tag sizes.
  final UntravelledTagSizes sizes;

  UntravelledTagTheme({
    required this.tokens,
    UntravelledTagColors? colors,
    UntravelledTagSizes? sizes,
  })  : colors = colors ??
            UntravelledTagColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
            ),
        sizes = sizes ?? UntravelledTagSizes(tokens: tokens);

  @override
  UntravelledTagTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTagColors? colors,
    UntravelledTagSizes? sizes,
  }) {
    return UntravelledTagTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledTagTheme lerp(ThemeExtension<UntravelledTagTheme>? other, double t) {
    if (other is! UntravelledTagTheme) return this;

    return UntravelledTagTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTagTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTagColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTagSizes>("sizes", sizes));
  }
}
