import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/linear_loader/linear_loader_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledLinearLoaderSizes extends ThemeExtension<UntravelledLinearLoaderSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (6x) Extra small linear loader properties.
  final UntravelledLinearLoaderSizeProperties x6s;

  /// (5x) Extra small linear loader properties.
  final UntravelledLinearLoaderSizeProperties x5s;

  /// (4x) Extra small linear loader properties.
  final UntravelledLinearLoaderSizeProperties x4s;

  /// (3x) Extra small linear loader properties.
  final UntravelledLinearLoaderSizeProperties x3s;

  /// (2x) Extra small linear loader properties.
  final UntravelledLinearLoaderSizeProperties x2s;

  UntravelledLinearLoaderSizes({
    required this.tokens,
    UntravelledLinearLoaderSizeProperties? x6s,
    UntravelledLinearLoaderSizeProperties? x5s,
    UntravelledLinearLoaderSizeProperties? x4s,
    UntravelledLinearLoaderSizeProperties? x3s,
    UntravelledLinearLoaderSizeProperties? x2s,
  })  : x6s = x6s ??
            UntravelledLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              loaderHeight: tokens.sizes.x6s,
            ),
        x5s = x5s ??
            UntravelledLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceXs,
              loaderHeight: tokens.sizes.x5s,
            ),
        x4s = x4s ??
            UntravelledLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceSm,
              loaderHeight: tokens.sizes.x4s,
            ),
        x3s = x3s ??
            UntravelledLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceMd,
              loaderHeight: tokens.sizes.x3s,
            ),
        x2s = x2s ??
            UntravelledLinearLoaderSizeProperties(
              borderRadius: tokens.borders.surfaceLg,
              loaderHeight: tokens.sizes.x2s,
            );

  @override
  UntravelledLinearLoaderSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledLinearLoaderSizeProperties? x6s,
    UntravelledLinearLoaderSizeProperties? x5s,
    UntravelledLinearLoaderSizeProperties? x4s,
    UntravelledLinearLoaderSizeProperties? x3s,
    UntravelledLinearLoaderSizeProperties? x2s,
  }) {
    return UntravelledLinearLoaderSizes(
      tokens: tokens ?? this.tokens,
      x6s: x6s ?? this.x6s,
      x5s: x5s ?? this.x5s,
      x4s: x4s ?? this.x4s,
      x3s: x3s ?? this.x3s,
      x2s: x2s ?? this.x2s,
    );
  }

  @override
  UntravelledLinearLoaderSizes lerp(ThemeExtension<UntravelledLinearLoaderSizes>? other, double t) {
    if (other is! UntravelledLinearLoaderSizes) return this;

    return UntravelledLinearLoaderSizes(
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
      ..add(DiagnosticsProperty("type", "UntravelledLinearLoaderSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizeProperties>("x6s", x6s))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizeProperties>("x5s", x5s))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizeProperties>("x4s", x4s))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizeProperties>("x3s", x3s))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderSizeProperties>("x2s", x2s));
  }
}
