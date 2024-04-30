import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/loaders/linear_loader/linear_loader_size_properties.dart';
import 'package:untravelled_app/core/theme/loaders/linear_loader/linear_loader_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/widgets/common/progress_indicators/linear_progress_indicator.dart';

enum UntravelledLinearLoaderSize {
  x6s,
  x5s,
  x4s,
  x3s,
  x2s,
}

class UntravelledLinearLoader extends StatelessWidget {
  /// Border radius of the linear loader widget.
  final BorderRadiusGeometry? borderRadius;

  /// Color of the linear loader widget.
  final Color? color;

  /// Background color of the linear loader widget.
  final Color? backgroundColor;

  /// Height of the linear loader widget.
  final double? height;

  /// Size of the linear loader widget.
  final UntravelledLinearLoaderSize? linearLoaderSize;

  /// MDS linear loader widget.
  const UntravelledLinearLoader({
    super.key,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.height,
    this.linearLoaderSize,
  });

  UntravelledLinearLoaderSizeProperties _getUntravelledLoaderSize(BuildContext context, UntravelledLinearLoaderSize? UntravelledLoaderSize) {
    switch (UntravelledLoaderSize) {
      case UntravelledLinearLoaderSize.x6s:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x6s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x6s;
      case UntravelledLinearLoaderSize.x5s:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x5s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x5s;
      case UntravelledLinearLoaderSize.x4s:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x4s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x4s;
      case UntravelledLinearLoaderSize.x3s:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x3s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x3s;
      case UntravelledLinearLoaderSize.x2s:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x2s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x2s;
      default:
        return context.untravelledTheme?.linearLoaderTheme.sizes.x4s ?? UntravelledLinearLoaderSizes(tokens: UntravelledTokens.light).x4s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledLinearLoaderSizeProperties effectiveLoaderSize = _getUntravelledLoaderSize(context, linearLoaderSize);

    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ?? effectiveLoaderSize.borderRadius;

    final Color effectiveColor = color ?? context.untravelledTheme?.linearLoaderTheme.colors.color ?? UntravelledColors.light.hit;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.linearLoaderTheme.colors.backgroundColor ?? UntravelledColors.light.trunks;

    final double effectiveHeight = height ?? effectiveLoaderSize.loaderHeight;

    return UntravelledLinearProgressIndicator(
      color: effectiveColor,
      backgroundColor: effectiveBackgroundColor,
      borderRadius: effectiveBorderRadius,
      minHeight: effectiveHeight,
    );
  }
}
