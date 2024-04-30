import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/button/button_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledButtonSizes extends ThemeExtension<UntravelledButtonSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Extra small button properties.
  final UntravelledButtonSizeProperties xs;

  /// Small button properties.
  final UntravelledButtonSizeProperties sm;

  /// Medium button properties.
  final UntravelledButtonSizeProperties md;

  /// Large button properties.
  final UntravelledButtonSizeProperties lg;

  /// Extra large button properties.
  final UntravelledButtonSizeProperties xl;

  UntravelledButtonSizes({
    required this.tokens,
    UntravelledButtonSizeProperties? xs,
    UntravelledButtonSizeProperties? sm,
    UntravelledButtonSizeProperties? md,
    UntravelledButtonSizeProperties? lg,
    UntravelledButtonSizeProperties? xl,
  })  : xs = xs ??
            UntravelledButtonSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.heading.text12,
            ),
        sm = sm ??
            UntravelledButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            UntravelledButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        lg = lg ??
            UntravelledButtonSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x3s,
              height: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.text16,
            ),
        xl = xl ??
            UntravelledButtonSizeProperties(
              borderRadius: tokens.borders.interactiveMd,
              gap: tokens.sizes.x2s,
              height: tokens.sizes.xl,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.xs),
              textStyle: tokens.typography.heading.text16,
            );

  @override
  UntravelledButtonSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledButtonSizeProperties? xs,
    UntravelledButtonSizeProperties? sm,
    UntravelledButtonSizeProperties? md,
    UntravelledButtonSizeProperties? lg,
    UntravelledButtonSizeProperties? xl,
  }) {
    return UntravelledButtonSizes(
      tokens: tokens ?? this.tokens,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  UntravelledButtonSizes lerp(ThemeExtension<UntravelledButtonSizes>? other, double t) {
    if (other is! UntravelledButtonSizes) return this;

    return UntravelledButtonSizes(
      tokens: tokens.lerp(other.tokens, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
      xl: xl.lerp(other.xl, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledButtonSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledButtonSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<UntravelledButtonSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledButtonSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledButtonSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<UntravelledButtonSizeProperties>("xl", xl));
  }
}
