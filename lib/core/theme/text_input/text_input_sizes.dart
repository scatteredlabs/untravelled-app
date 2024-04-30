import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/text_input/text_input_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTextInputSizes extends ThemeExtension<UntravelledTextInputSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Small TextInput properties.
  final UntravelledTextInputSizeProperties sm;

  /// Medium TextInput properties.
  final UntravelledTextInputSizeProperties md;

  /// Large TextInput properties.
  final UntravelledTextInputSizeProperties lg;

  /// Extra large (floating) TextInput properties.
  final UntravelledTextInputSizeProperties xl;

  UntravelledTextInputSizes({
    required this.tokens,
    UntravelledTextInputSizeProperties? sm,
    UntravelledTextInputSizeProperties? md,
    UntravelledTextInputSizeProperties? lg,
    UntravelledTextInputSizeProperties? xl,
  })  : sm = sm ??
            UntravelledTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveXs,
              height: tokens.sizes.sm,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x4s,
                vertical: tokens.sizes.x6s,
              ),
              textStyle: tokens.typography.body.textDefault,
            ),
        md = md ??
            UntravelledTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.md,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x3s,
                vertical: 6,
              ),
              textStyle: tokens.typography.body.textDefault,
            ),
        lg = lg ??
            UntravelledTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.lg,
              gap: tokens.sizes.x4s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x3s,
                vertical: tokens.sizes.x4s,
              ),
              textStyle: tokens.typography.body.text16,
            ),
        xl = xl ??
            UntravelledTextInputSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              height: tokens.sizes.xl,
              gap: tokens.sizes.x2s,
              iconSizeValue: tokens.sizes.xs,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.sizes.x2s,
                vertical: 10,
              ),
              textStyle: tokens.typography.body.text16,
            );

  @override
  UntravelledTextInputSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledTextInputSizeProperties? sm,
    UntravelledTextInputSizeProperties? md,
    UntravelledTextInputSizeProperties? lg,
    UntravelledTextInputSizeProperties? xl,
  }) {
    return UntravelledTextInputSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  UntravelledTextInputSizes lerp(ThemeExtension<UntravelledTextInputSizes>? other, double t) {
    if (other is! UntravelledTextInputSizes) return this;

    return UntravelledTextInputSizes(
      tokens: tokens.lerp(other.tokens, t),
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
      ..add(DiagnosticsProperty("type", "UntravelledTextInputSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTextInputSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledTextInputSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledTextInputSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<UntravelledTextInputSizeProperties>("xl", xl));
  }
}
