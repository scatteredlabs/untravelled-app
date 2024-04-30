import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/avatar/avatar_colors.dart';
import 'package:untravelled_app/core/theme/avatar/avatar_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAvatarTheme extends ThemeExtension<UntravelledAvatarTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Avatar colors.
  final UntravelledAvatarColors colors;

  /// Avatar sizes.
  final UntravelledAvatarSizes sizes;

  UntravelledAvatarTheme({
    required this.tokens,
    UntravelledAvatarColors? colors,
    UntravelledAvatarSizes? sizes,
  })  : colors = colors ??
            UntravelledAvatarColors(
              backgroundColor: tokens.colors.gohan,
              badgeColor: tokens.colors.roshi100,
              iconColor: tokens.colors.iconPrimary,
              textColor: tokens.colors.textPrimary,
            ),
        sizes = sizes ?? UntravelledAvatarSizes(tokens: tokens);

  @override
  UntravelledAvatarTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledAvatarColors? colors,
    UntravelledAvatarSizes? sizes,
  }) {
    return UntravelledAvatarTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledAvatarTheme lerp(ThemeExtension<UntravelledAvatarTheme>? other, double t) {
    if (other is! UntravelledAvatarTheme) return this;

    return UntravelledAvatarTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAvatarTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAvatarColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledAvatarSizes>("sizes", sizes));
  }
}
