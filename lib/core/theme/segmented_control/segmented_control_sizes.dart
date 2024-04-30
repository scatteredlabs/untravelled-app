import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/segmented_control/segmented_control_size_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledSegmentedControlSizes extends ThemeExtension<UntravelledSegmentedControlSizes> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Small segmentedControl item properties.
  final UntravelledSegmentedControlSizeProperties sm;

  /// Medium segmentedControl item properties.
  final UntravelledSegmentedControlSizeProperties md;

  UntravelledSegmentedControlSizes({
    required this.tokens,
    UntravelledSegmentedControlSizeProperties? sm,
    UntravelledSegmentedControlSizeProperties? md,
  })  : sm = sm ??
            UntravelledSegmentedControlSizeProperties(
              segmentBorderRadius: tokens.borders.interactiveSm,
              segmentGap: tokens.sizes.x5s,
              height: tokens.sizes.md,
              iconSizeValue: tokens.sizes.xs,
              segmentPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x3s),
              textStyle: tokens.typography.heading.textDefault,
            ),
        md = md ??
            UntravelledSegmentedControlSizeProperties(
              segmentBorderRadius: tokens.borders.interactiveSm,
              segmentGap: tokens.sizes.x4s,
              height: tokens.sizes.lg,
              iconSizeValue: tokens.sizes.xs,
              segmentPadding: EdgeInsets.symmetric(horizontal: tokens.sizes.x2s),
              textStyle: tokens.typography.heading.textDefault,
            );

  @override
  UntravelledSegmentedControlSizes copyWith({
    UntravelledTokens? tokens,
    UntravelledSegmentedControlSizeProperties? sm,
    UntravelledSegmentedControlSizeProperties? md,
  }) {
    return UntravelledSegmentedControlSizes(
      tokens: tokens ?? this.tokens,
      sm: sm ?? this.sm,
      md: md ?? this.md,
    );
  }

  @override
  UntravelledSegmentedControlSizes lerp(ThemeExtension<UntravelledSegmentedControlSizes>? other, double t) {
    if (other is! UntravelledSegmentedControlSizes) return this;

    return UntravelledSegmentedControlSizes(
      tokens: tokens.lerp(other.tokens, t),
      sm: sm.lerp(other.sm, t),
      md: md.lerp(other.md, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSegmentedControlSizes"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlSizeProperties>("sm", sm))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlSizeProperties>("md", md));
  }
}
