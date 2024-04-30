import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/switch/switch_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledSwitchSizes extends ThemeExtension<UntravelledSwitchSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// (2x) Extra small switch properties.
  final UntravelledSwitchSizeProperties x2s;

  /// Extra small switch properties.
  final UntravelledSwitchSizeProperties xs;

  /// Small switch properties.
  final UntravelledSwitchSizeProperties sm;

  UntravelledSwitchSizes({
    required this.tokens,
    UntravelledSwitchSizeProperties? x2s,
    UntravelledSwitchSizeProperties? xs,
    UntravelledSwitchSizeProperties? sm,
  })  : x2s = x2s ??
            UntravelledSwitchSizeProperties(
              height: tokens.sizes.x2s,
              width: 2 * tokens.sizes.x3s + 2 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.x3s,
              iconSizeValue: tokens.sizes.x3s,
              padding: EdgeInsets.all(tokens.sizes.x6s),
              textStyle: tokens.typography.caption.text6.copyWith(letterSpacing: kIsWeb ? 0.5 : 0.1),
            ),
        xs = xs ??
            UntravelledSwitchSizeProperties(
              height: tokens.sizes.xs,
              width: 2 * tokens.sizes.x2s + 3 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.x2s,
              padding: EdgeInsets.all(tokens.sizes.x5s),
              textStyle: tokens.typography.caption.text8.copyWith(letterSpacing: kIsWeb ? 0.5 : 0.1),
            ),
        sm = sm ??
            UntravelledSwitchSizeProperties(
              height: tokens.sizes.sm,
              width: 2 * tokens.sizes.xs + 3 * tokens.sizes.x5s,
              thumbSizeValue: tokens.sizes.xs,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.all(tokens.sizes.x5s),
              textStyle: tokens.typography.caption.text10.copyWith(letterSpacing: kIsWeb ? 0.5 : 0.1),
            );

  @override
  UntravelledSwitchSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledSwitchSizeProperties? x2s,
    UntravelledSwitchSizeProperties? xs,
    UntravelledSwitchSizeProperties? sm,
  }) {
    return UntravelledSwitchSizes(
      tokens: tokens ?? this.tokens,
      x2s: x2s ?? this.x2s,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
    );
  }

  @override
  UntravelledSwitchSizes lerp(ThemeExtension<UntravelledSwitchSizes>? other, double t) {
    if (other is! UntravelledSwitchSizes) return this;

    return UntravelledSwitchSizes(
      tokens: tokens.lerp(other.tokens, t),
      x2s: x2s.lerp(other.x2s, t),
      xs: xs.lerp(other.xs, t),
      sm: sm.lerp(other.sm, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSwitchSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledSwitchSizeProperties>("x2s", x2s))
      ..add(DiagnosticsProperty<UntravelledSwitchSizeProperties>("xs", xs))
      ..add(DiagnosticsProperty<UntravelledSwitchSizeProperties>("sm", sm));
  }
}
