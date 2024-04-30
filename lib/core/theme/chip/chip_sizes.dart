import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/chip/chip_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledChipSizes extends ThemeExtension<UntravelledChipSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Small chip properties.
  final UntravelledChipSizeProperties sm;

  /// Medium chip properties.
  final UntravelledChipSizeProperties md;

  UntravelledChipSizes({
    required this.tokens,
    UntravelledChipSizeProperties? sm,
    UntravelledChipSizeProperties? md,
  })  : sm = sm ??
            UntravelledChipSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.body.textDefault,
            ),
        md = md ??
            UntravelledChipSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              gap: tokens.sizes.x4s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledChipSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledChipSizeProperties? sm,
    UntravelledChipSizeProperties? md,
  }) {
    return UntravelledChipSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  UntravelledChipSizes lerp(ThemeExtension<UntravelledChipSizes>? other, double t) {
    if (other is! UntravelledChipSizes) return this;

    return UntravelledChipSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledChipSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledChipSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledChipSizeProperties>("md", md));
  }
}
