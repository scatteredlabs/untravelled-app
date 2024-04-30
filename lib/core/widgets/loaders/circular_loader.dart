import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/circular_loader/circular_loader_size_properties.dart';
import 'package:untravelled_app/core/theme/loaders/circular_loader/circular_loader_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/widgets/common/progress_indicators/circular_progress_indicator.dart';

enum UntravelledCircularLoaderSize {
  x2s,
  xs,
  sm,
  md,
  lg,
}

class UntravelledCircularLoader extends StatelessWidget {
  /// Color of the circular loader widget.
  final Color? color;

  /// Background color of the circular loader widget.
  final Color? backgroundColor;

  /// Size value of the circular loader widget.
  final double? sizeValue;

  /// Stroke width of the circular loader widget.
  final double? strokeWidth;

  /// Size of the circular loader widget.
  final UntravelledCircularLoaderSize? circularLoaderSize;

  /// Stroke cap of the circular loader widget.
  final StrokeCap? strokeCap;

  /// MDS circular loader widget.
  const UntravelledCircularLoader({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    this.circularLoaderSize,
    this.strokeCap,
  });

  UntravelledCircularLoaderSizeProperties _getUntravelledLoaderSize(BuildContext context, UntravelledCircularLoaderSize? UntravelledLoaderSize) {
    switch (UntravelledLoaderSize) {
      case UntravelledCircularLoaderSize.x2s:
        return context.untravelledTheme?.circularLoaderTheme.sizes.x2s ??
            UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).x2s;
      case UntravelledCircularLoaderSize.xs:
        return context.untravelledTheme?.circularLoaderTheme.sizes.xs ?? UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).xs;
      case UntravelledCircularLoaderSize.sm:
        return context.untravelledTheme?.circularLoaderTheme.sizes.sm ?? UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).sm;
      case UntravelledCircularLoaderSize.md:
        return context.untravelledTheme?.circularLoaderTheme.sizes.md ?? UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).md;
      case UntravelledCircularLoaderSize.lg:
        return context.untravelledTheme?.circularLoaderTheme.sizes.lg ?? UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).lg;
      default:
        return context.untravelledTheme?.circularLoaderTheme.sizes.md ?? UntravelledCircularLoaderSizes(tokens: UntravelledTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledCircularLoaderSizeProperties effectiveLoaderSize = _getUntravelledLoaderSize(context, circularLoaderSize);

    final Color effectiveColor = color ?? context.untravelledTheme?.circularLoaderTheme.colors.color ?? UntravelledColors.light.hit;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.circularLoaderTheme.colors.backgroundColor ?? UntravelledColors.light.trunks;

    final double effectiveSize = sizeValue ?? effectiveLoaderSize.loaderSizeValue;

    final double effectiveStrokeWidth = strokeWidth ?? effectiveLoaderSize.loaderStrokeWidth;

    final StrokeCap effectiveStrokeCap = strokeCap ?? StrokeCap.round;

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: UntravelledCircularProgressIndicator(
        color: effectiveColor,
        backgroundColor: effectiveBackgroundColor,
        strokeWidth: effectiveStrokeWidth,
        strokeCap: effectiveStrokeCap,
      ),
    );
  }
}
