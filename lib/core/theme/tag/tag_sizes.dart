import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tag/tag_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTagSizes extends ThemeExtension<UntravelledTagSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (2x) Extra small tag properties.
  final UntravelledTagSizeProperties x2s;

  /// Extra small tag properties.
  final UntravelledTagSizeProperties xs;

  UntravelledTagSizes({
    required this.tokens,
    UntravelledTagSizeProperties? x2s,
    UntravelledTagSizeProperties? xs,
  })  : x2s = x2s ??
            UntravelledTagSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.x3s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.body.text10,
              upperCaseTextStyle: tokens.typography.caption.text9,
            ),
        xs = xs ??
            UntravelledTagSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x5s,
              height: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              textStyle: tokens.typography.body.text12,
              upperCaseTextStyle: tokens.typography.caption.text10,
            );

  @override
  UntravelledTagSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledTagSizeProperties? x2s,
    UntravelledTagSizeProperties? xs,
  }) {
    return UntravelledTagSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
    );
  }

  @override
  UntravelledTagSizes lerp(ThemeExtension<UntravelledTagSizes>? other, double t) {
    if (other is! UntravelledTagSizes) return this;

    return UntravelledTagSizes(
      tokens: tokens.lerp(other.tokens, t),
      x2s: x2s.lerp(other.x2s, t),
      xs: xs.lerp(other.xs, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTagSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTagSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<UntravelledTagSizeProperties>("xs", xs));
  }
}
