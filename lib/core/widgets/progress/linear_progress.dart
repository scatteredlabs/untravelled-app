import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/progress/linear_progress/linear_progress_size_properties.dart';
import 'package:untravelled_app/core/theme/progress/linear_progress/linear_progress_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/widgets/common/progress_indicators/linear_progress_indicator.dart';
import 'package:untravelled_app/core/widgets/progress_pin/pin_style.dart';
import 'package:untravelled_app/core/widgets/progress_pin/progress_pin.dart';

enum UntravelledLinearProgressSize {
  x6s,
  x5s,
  x4s,
  x3s,
  x2s,
}

class UntravelledLinearProgress extends StatelessWidget {
  /// Show linear progress with thumb and pin.
  final bool showPin;

  /// Border radius value of the linear progress widget.
  final BorderRadiusGeometry? borderRadius;

  /// Color of the linear progress widget.
  final Color? color;

  /// Background color of the linear progress widget.
  final Color? backgroundColor;

  /// Height of the linear progress widget.
  final double? height;

  /// Value of the linear progress widget.
  final double value;

  /// Size of the linear progress widget.
  final UntravelledLinearProgressSize? linearProgressSize;

  /// Style for the linear progress pin.
  final PinStyle? pinStyle;

  /// The semantic label for the linear progress widget.
  final String? semanticLabel;

  /// MDS linear progress widget.
  const UntravelledLinearProgress({
    super.key,
    this.showPin = false,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.height,
    required this.value,
    this.linearProgressSize,
    this.pinStyle,
    this.semanticLabel,
  });

  UntravelledLinearProgressSizeProperties _getUntravelledProgressSize(
    BuildContext context,
    UntravelledLinearProgressSize? UntravelledProgressSize,
  ) {
    switch (UntravelledProgressSize) {
      case UntravelledLinearProgressSize.x6s:
        return context.untravelledTheme?.linearProgressTheme.sizes.x6s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x6s;
      case UntravelledLinearProgressSize.x5s:
        return context.untravelledTheme?.linearProgressTheme.sizes.x5s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x5s;
      case UntravelledLinearProgressSize.x4s:
        return context.untravelledTheme?.linearProgressTheme.sizes.x4s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x4s;
      case UntravelledLinearProgressSize.x3s:
        return context.untravelledTheme?.linearProgressTheme.sizes.x3s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x3s;
      case UntravelledLinearProgressSize.x2s:
        return context.untravelledTheme?.linearProgressTheme.sizes.x2s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x2s;
      default:
        return context.untravelledTheme?.linearProgressTheme.sizes.x4s ??
            UntravelledLinearProgressSizes(tokens: UntravelledTokens.light).x4s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledLinearProgressSizeProperties effectiveProgressSize = _getUntravelledProgressSize(context, linearProgressSize);

    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ?? effectiveProgressSize.borderRadius;

    final Color effectiveColor =
        color ?? context.untravelledTheme?.linearProgressTheme.colors.color ?? UntravelledColors.light.piccolo;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.linearProgressTheme.colors.backgroundColor ?? UntravelledColors.light.beerus;

    final double effectiveHeight = height ?? effectiveProgressSize.progressHeight;

    return Semantics(
      label: semanticLabel,
      value: "${value * 100}%",
      child: showPin
          ? UntravelledProgressPin(
              progressValue: value,
              progressLabel: '${(value * 100).round()}%',
              pinStyle: pinStyle,
              child: UntravelledLinearProgressIndicator(
                value: value,
                color: effectiveColor,
                backgroundColor: effectiveBackgroundColor,
                borderRadius: effectiveBorderRadius,
                minHeight: effectiveHeight,
              ),
            )
          : UntravelledLinearProgressIndicator(
              value: value,
              color: effectiveColor,
              backgroundColor: effectiveBackgroundColor,
              borderRadius: effectiveBorderRadius,
              minHeight: effectiveHeight,
            ),
    );
  }
}
