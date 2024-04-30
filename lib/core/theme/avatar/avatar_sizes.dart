import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/avatar/avatar_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAvatarSizes extends ThemeExtension<UntravelledAvatarSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Extra small avatar properties.
  final UntravelledAvatarSizeProperties xs;

  /// Small avatar properties.
  final UntravelledAvatarSizeProperties sm;

  /// Medium avatar properties.
  final UntravelledAvatarSizeProperties md;

  /// Large avatar properties.
  final UntravelledAvatarSizeProperties lg;

  /// Extra large avatar properties.
  final UntravelledAvatarSizeProperties xl;

  /// (2x) Extra large avatar properties.
  final UntravelledAvatarSizeProperties x2l;

  UntravelledAvatarSizes({
    required this.tokens,
    UntravelledAvatarSizeProperties? xs,
    UntravelledAvatarSizeProperties? sm,
    UntravelledAvatarSizeProperties? md,
    UntravelledAvatarSizeProperties? lg,
    UntravelledAvatarSizeProperties? xl,
    UntravelledAvatarSizeProperties? x2l,
  })  : xs = xs ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              avatarSizeValue: tokens.sizes.xs,
              badgeMarginValue: tokens.sizes.xs * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.xs * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text10,
            ),
        sm = sm ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.sm,
              badgeMarginValue: tokens.sizes.sm * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.sm * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text12,
            ),
        md = md ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.md,
              badgeMarginValue: tokens.sizes.md * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.md * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.textDefault,
            ),
        lg = lg ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              avatarSizeValue: tokens.sizes.lg,
              badgeMarginValue: tokens.sizes.lg * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.lg * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text16,
            ),
        xl = xl ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              avatarSizeValue: tokens.sizes.xl,
              badgeMarginValue: tokens.sizes.xl * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.xl * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text16,
            ),
        x2l = x2l ??
            UntravelledAvatarSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              avatarSizeValue: tokens.sizes.x2l,
              badgeMarginValue: tokens.sizes.x2l * tokens.sizes.x5s / tokens.sizes.x2l,
              badgeSizeValue: tokens.sizes.x2l * tokens.sizes.x3s / tokens.sizes.x2l,
              textStyle: tokens.typography.heading.text20,
            );

  @override
  UntravelledAvatarSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledAvatarSizeProperties? xs,
    UntravelledAvatarSizeProperties? sm,
    UntravelledAvatarSizeProperties? md,
    UntravelledAvatarSizeProperties? lg,
    UntravelledAvatarSizeProperties? xl,
    UntravelledAvatarSizeProperties? x2l,
  }) {
    return UntravelledAvatarSizes(
      tokens: tokens ?? this.tokens,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      x2l: x2l ?? this.x2l,
    );
  }

  @override
  UntravelledAvatarSizes lerp(ThemeExtension<UntravelledAvatarSizes>? other, double t) {
    if (other is! UntravelledAvatarSizes) return this;

    return UntravelledAvatarSizes(
      tokens: tokens,
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
      xl: xl.lerp(other.xl, t),
      x2l: x2l.lerp(other.x2l, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAvatarSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("xl", xl))
      ..add(DiagnosticsProperty<UntravelledAvatarSizeProperties>("x2l", x2l));
  }
}
