import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tab_bar/tab_bar_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTabBarSizes extends ThemeExtension<UntravelledTabBarSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Small TabBar item properties.
  final UntravelledTabBarSizeProperties sm;

  /// Medium TabBar item properties.
  final UntravelledTabBarSizeProperties md;

  UntravelledTabBarSizes({
    required this.tokens,
    UntravelledTabBarSizeProperties? sm,
    UntravelledTabBarSizeProperties? md,
  })  : sm = sm ??
            UntravelledTabBarSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              tabGap: tokens.sizes.x5s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              indicatorHeight: tokens.sizes.x6s,
              tabPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            UntravelledTabBarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              tabGap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              indicatorHeight: tokens.sizes.x6s,
              tabPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            );

  @override
  UntravelledTabBarSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledTabBarSizeProperties? sm,
    UntravelledTabBarSizeProperties? md,
  }) {
    return UntravelledTabBarSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  UntravelledTabBarSizes lerp(ThemeExtension<UntravelledTabBarSizes>? other, double t) {
    if (other is! UntravelledTabBarSizes) return this;

    return UntravelledTabBarSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTabBarSizes"))
      ..add(DiagnosticsProperty<UntravelledTabBarSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledTabBarSizeProperties>("md", md));
  }
}
