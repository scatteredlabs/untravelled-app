import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/linear_progress/linear_progress_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledLinearProgressSizes extends ThemeExtension<UntravelledLinearProgressSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (6x) Extra small linear progress properties.
  final UntravelledLinearProgressSizeProperties x6s;

  /// (5x) Extra small linear progress properties.
  final UntravelledLinearProgressSizeProperties x5s;

  /// (4x) Extra small linear progress properties.
  final UntravelledLinearProgressSizeProperties x4s;

  /// (3x) Extra small linear progress properties.
  final UntravelledLinearProgressSizeProperties x3s;

  /// (2x) Extra small linear progress properties.
  final UntravelledLinearProgressSizeProperties x2s;

  UntravelledLinearProgressSizes({
    required this.tokens,
    UntravelledLinearProgressSizeProperties? x6s,
    UntravelledLinearProgressSizeProperties? x5s,
    UntravelledLinearProgressSizeProperties? x4s,
    UntravelledLinearProgressSizeProperties? x3s,
    UntravelledLinearProgressSizeProperties? x2s,
  })  : x6s = x6s ??
            UntravelledLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              progressHeight: tokens.sizes.x6s,
            ),
        x5s = x5s ??
            UntravelledLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              progressHeight: tokens.sizes.x5s,
            ),
        x4s = x4s ??
            UntravelledLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceSm,
              progressHeight: tokens.sizes.x4s,
            ),
        x3s = x3s ??
            UntravelledLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceMd,
              progressHeight: tokens.sizes.x3s,
            ),
        x2s = x2s ??
            UntravelledLinearProgressSizeProperties(
              borderRadius: tokens.borders.surfaceLg,
              progressHeight: tokens.sizes.x2s,
            );

  @override
  UntravelledLinearProgressSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledLinearProgressSizeProperties? x6s,
    UntravelledLinearProgressSizeProperties? x5s,
    UntravelledLinearProgressSizeProperties? x4s,
    UntravelledLinearProgressSizeProperties? x3s,
    UntravelledLinearProgressSizeProperties? x2s,
  }) {
    return UntravelledLinearProgressSizes(
      tokens: tokens ?? this.tokens,
      x6s: x6s ?? this.x6s,
      x5s: x5s ?? this.x5s,
      x4s: x4s ?? this.x4s,
      x3s: x3s ?? this.x3s,
      x2s: x2s ?? this.x2s,
    );
  }

  @override
  UntravelledLinearProgressSizes lerp(ThemeExtension<UntravelledLinearProgressSizes>? other, double t) {
    if (other is! UntravelledLinearProgressSizes) return this;

    return UntravelledLinearProgressSizes(
      tokens: tokens.lerp(other.tokens, t),
      x6s: x6s.lerp(other.x6s, t),
      x5s: x5s.lerp(other.x5s, t),
      x4s: x4s.lerp(other.x4s, t),
      x3s: x3s.lerp(other.x3s, t),
      x2s: x2s.lerp(other.x2s, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledLinearProgressSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizeProperties>("x6s", x6s))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizeProperties>("x5s", x5s))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizeProperties>("x4s", x4s))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizeProperties>("x3s", x3s))
      ..add(DiagnosticsProperty<UntravelledLinearProgressSizeProperties>("x2s", x2s));
  }
}
