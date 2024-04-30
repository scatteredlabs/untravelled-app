import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/accordion/accordion_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledAccordionSizes extends ThemeExtension<UntravelledAccordionSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Small accordion properties.
  final UntravelledAccordionSizeProperties sm;

  /// Medium accordion properties.
  final UntravelledAccordionSizeProperties md;

  /// Large accordion properties.
  final UntravelledAccordionSizeProperties lg;

  /// Extra large accordion properties.
  final UntravelledAccordionSizeProperties xl;

  UntravelledAccordionSizes({
    required this.tokens,
    UntravelledAccordionSizeProperties? sm,
    UntravelledAccordionSizeProperties? md,
    UntravelledAccordionSizeProperties? lg,
    UntravelledAccordionSizeProperties? xl,
  })  : sm = sm ??
            UntravelledAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.sm,
              iconSizeValue: tokens.sizes.x2s,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x4s),
              headerTextStyle: tokens.typography.heading.text12,
              contentTextStyle: tokens.typography.body.text12,
            ),
        md = md ??
            UntravelledAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        lg = lg ??
            UntravelledAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              headerTextStyle: tokens.typography.heading.textDefault,
              contentTextStyle: tokens.typography.body.textDefault,
            ),
        xl = xl ??
            UntravelledAccordionSizeProperties(
              borderRadius: tokens.borders.interactiveSm,
              headerHeight: tokens.sizes.xl,
              iconSizeValue: tokens.sizes.xs,
              headerPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              headerTextStyle: tokens.typography.heading.text16,
              contentTextStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledAccordionSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledAccordionSizeProperties? sm,
    UntravelledAccordionSizeProperties? md,
    UntravelledAccordionSizeProperties? lg,
    UntravelledAccordionSizeProperties? xl,
  }) {
    return UntravelledAccordionSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  UntravelledAccordionSizes lerp(ThemeExtension<UntravelledAccordionSizes>? other, double t) {
    if (other is! UntravelledAccordionSizes) return this;

    return UntravelledAccordionSizes(
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
      ..add(DiagnosticsProperty("type", "UntravelledAccordionSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAccordionSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledAccordionSizeProperties>("md", md))
      ..add(DiagnosticsProperty<UntravelledAccordionSizeProperties>("lg", lg))
      ..add(DiagnosticsProperty<UntravelledAccordionSizeProperties>("xl", xl));
  }
}
