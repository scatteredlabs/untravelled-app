import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/circular_loader/circular_loader_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCircularLoaderSizes extends ThemeExtension<UntravelledCircularLoaderSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (2x) Extra small circular loader properties.
  final UntravelledCircularLoaderSizeProperties x2s;

  /// Extra small circular loader properties.
  final UntravelledCircularLoaderSizeProperties xs;

  /// Small circular loader properties.
  final UntravelledCircularLoaderSizeProperties sm;

  /// Medium circular loader properties.
  final UntravelledCircularLoaderSizeProperties md;

  /// Large circular loader properties.
  final UntravelledCircularLoaderSizeProperties lg;

  UntravelledCircularLoaderSizes({
    required this.tokens,
    UntravelledCircularLoaderSizeProperties? x2s,
    UntravelledCircularLoaderSizeProperties? xs,
    UntravelledCircularLoaderSizeProperties? sm,
    UntravelledCircularLoaderSizeProperties? md,
    UntravelledCircularLoaderSizeProperties? lg,
  })  : x2s = x2s ??
            UntravelledCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.x2s,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        xs = xs ??
            UntravelledCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.xs,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        sm = sm ??
            UntravelledCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.sm,
              loaderStrokeWidth: tokens.sizes.x6s,
            ),
        md = md ??
            UntravelledCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.md,
              loaderStrokeWidth: tokens.sizes.x5s,
            ),
        lg = lg ??
            UntravelledCircularLoaderSizeProperties(
              loaderSizeValue: tokens.sizes.lg,
              loaderStrokeWidth: tokens.sizes.x5s,
            );

  @override
  UntravelledCircularLoaderSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledCircularLoaderSizeProperties? x2s,
    UntravelledCircularLoaderSizeProperties? xs,
    UntravelledCircularLoaderSizeProperties? sm,
    UntravelledCircularLoaderSizeProperties? md,
    UntravelledCircularLoaderSizeProperties? lg,
  }) {
    return UntravelledCircularLoaderSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  UntravelledCircularLoaderSizes lerp(ThemeExtension<UntravelledCircularLoaderSizes>? other, double t) {
    if (other is! UntravelledCircularLoaderSizes) return this;

    return UntravelledCircularLoaderSizes(
      tokens: tokens.lerp(other.tokens, t),
      x2s: x2s.lerp(other.x2s, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
      lg: lg.lerp(other.lg, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCircularLoaderSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderSizeProperties>("lg", lg));
  }
}
