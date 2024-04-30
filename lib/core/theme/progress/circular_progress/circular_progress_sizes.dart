import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledCircularProgressSizes extends ThemeExtension<UntravelledCircularProgressSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (2x) Extra small circular progress properties.
  final UntravelledCircularProgressSizeProperties x2s;

  /// Extra small circular progress properties.
  final UntravelledCircularProgressSizeProperties xs;

  /// Small circular progress properties.
  final UntravelledCircularProgressSizeProperties sm;

  /// Medium circular progress properties.
  final UntravelledCircularProgressSizeProperties md;

  /// Large circular progress properties.
  final UntravelledCircularProgressSizeProperties lg;

  UntravelledCircularProgressSizes({
    required this.tokens,
    UntravelledCircularProgressSizeProperties? x2s,
    UntravelledCircularProgressSizeProperties? xs,
    UntravelledCircularProgressSizeProperties? sm,
    UntravelledCircularProgressSizeProperties? md,
    UntravelledCircularProgressSizeProperties? lg,
  })  : x2s = x2s ??
            UntravelledCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.x2s,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        xs = xs ??
            UntravelledCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.xs,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        sm = sm ??
            UntravelledCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.sm,
              progressStrokeWidth: tokens.sizes.x6s,
            ),
        md = md ??
            UntravelledCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.md,
              progressStrokeWidth: tokens.sizes.x5s,
            ),
        lg = lg ??
            UntravelledCircularProgressSizeProperties(
              progressSizeValue: tokens.sizes.lg,
              progressStrokeWidth: tokens.sizes.x5s,
            );

  @override
  UntravelledCircularProgressSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledCircularProgressSizeProperties? x2s,
    UntravelledCircularProgressSizeProperties? xs,
    UntravelledCircularProgressSizeProperties? sm,
    UntravelledCircularProgressSizeProperties? md,
    UntravelledCircularProgressSizeProperties? lg,
  }) {
    return UntravelledCircularProgressSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  UntravelledCircularProgressSizes lerp(ThemeExtension<UntravelledCircularProgressSizes>? other, double t) {
    if (other is! UntravelledCircularProgressSizes) return this;

    return UntravelledCircularProgressSizes(
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
      ..add(DiagnosticsProperty("type", "UntravelledCircularProgressSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledCircularProgressSizeProperties>("lg", lg));
  }
}
