import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/circular_progress/circular_progress_size_properties.dart';
import 'package:untravelled_app/core/theme/progress/circular_progress/circular_progress_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/widgets/common/progress_indicators/circular_progress_indicator.dart';

enum UntravelledCircularProgressSize {
  x2s,
  xs,
  sm,
  md,
  lg,
}

class UntravelledCircularProgress extends StatelessWidget {
  /// Color of the circular progress widget.
  final Color? color;

  /// Background color of the circular progress widget.
  final Color? backgroundColor;

  /// Size value of the circular progress widget.
  final double? sizeValue;

  /// Stroke width of the circular progress widget.
  final double? strokeWidth;

  /// Value of the circular progress widget.
  final double value;

  /// Size of the circular progress widget.
  final UntravelledCircularProgressSize? circularProgressSize;

  /// The semantic label for the circular progress widget.
  final String? semanticLabel;

  /// Stroke cap of the circular progress widget.
  final StrokeCap? strokeCap;

  /// MDS circular progress widget.
  const UntravelledCircularProgress({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    required this.value,
    this.circularProgressSize,
    this.semanticLabel,
    this.strokeCap,
  });

  UntravelledCircularProgressSizeProperties _getUntravelledCircularProgressSize(
    BuildContext context,
    UntravelledCircularProgressSize? untravelledCircularProgressSize,
  ) {
    switch (untravelledCircularProgressSize) {
      case UntravelledCircularProgressSize.x2s:
        return context.untravelledTheme?.circularProgressTheme.sizes.x2s ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).x2s;
      case UntravelledCircularProgressSize.xs:
        return context.untravelledTheme?.circularProgressTheme.sizes.xs ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).xs;
      case UntravelledCircularProgressSize.sm:
        return context.untravelledTheme?.circularProgressTheme.sizes.sm ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).sm;
      case UntravelledCircularProgressSize.md:
        return context.untravelledTheme?.circularProgressTheme.sizes.md ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).md;
      case UntravelledCircularProgressSize.lg:
        return context.untravelledTheme?.circularProgressTheme.sizes.lg ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).lg;
      default:
        return context.untravelledTheme?.circularProgressTheme.sizes.md ??
            UntravelledCircularProgressSizes(tokens: UntravelledTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor =
        color ?? context.untravelledTheme?.circularProgressTheme.colors.color ?? UntravelledColors.light.piccolo;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.circularProgressTheme.colors.backgroundColor ?? UntravelledColors.light.beerus;

    final UntravelledCircularProgressSizeProperties effectiveUntravelledCircularProgressSize =
        _getUntravelledCircularProgressSize(context, circularProgressSize);

    final double effectiveSize = sizeValue ?? effectiveUntravelledCircularProgressSize.progressSizeValue;

    final double effectiveStrokeWidth = strokeWidth ?? effectiveUntravelledCircularProgressSize.progressStrokeWidth;

    final StrokeCap effectiveStrokeCap = strokeCap ?? StrokeCap.round;

    return Semantics(
      label: semanticLabel,
      value: "${value * 100}%",
      child: SizedBox(
        height: effectiveSize,
        width: effectiveSize,
        child: UntravelledCircularProgressIndicator(
          color: effectiveColor,
          backgroundColor: effectiveBackgroundColor,
          strokeWidth: effectiveStrokeWidth,
          value: value,
          strokeCap: effectiveStrokeCap,
        ),
      ),
    );
  }
}
