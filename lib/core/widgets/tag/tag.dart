import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tag/tag_size_properties.dart';
import 'package:untravelled_app/core/theme/tag/tag_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';

enum UntravelledTagSize {
  x2s,
  xs,
}

class UntravelledTag extends StatelessWidget {
  /// Whether the tag should use upper case text style.
  final bool isUpperCase;

  /// The border radius of the tag.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the tag.
  final Color? backgroundColor;

  /// The height of the tag.
  final double? height;

  /// The width of the tag.
  final double? width;

  /// The gap between the leading or trailing and the label widgets.
  final double? gap;

  /// The padding of the tag.
  final EdgeInsetsGeometry? padding;

  /// The size of the tag.
  final UntravelledTagSize? tagSize;

  /// Custom decoration for the tag.
  final Decoration? decoration;

  /// The semantic label for the tag.
  final String? semanticLabel;

  /// The callback that is called when the tag is tapped or pressed.
  final VoidCallback? onTap;

  /// The callback that is called when the tag is long-pressed.
  final VoidCallback? onLongPress;

  /// The widget in the leading slot of the tag.
  final Widget? leading;

  /// The widget in the label slot of the tag.
  final Widget? label;

  /// The widget in the trailing slot of the tag.
  final Widget? trailing;

  /// MDS tag widget.
  const UntravelledTag({
    super.key,
    this.isUpperCase = true,
    this.borderRadius,
    this.backgroundColor,
    this.height,
    this.width,
    this.gap,
    this.padding,
    this.tagSize,
    this.decoration,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.label,
    this.trailing,
  });

  UntravelledTagSizeProperties _getUntravelledTagSize(BuildContext context, UntravelledTagSize? untravelledTagSize) {
    switch (untravelledTagSize) {
      case UntravelledTagSize.x2s:
        return context.untravelledTheme?.tagTheme.sizes.x2s ?? UntravelledTagSizes(tokens: UntravelledTokens.light).x2s;
      case UntravelledTagSize.xs:
        return context.untravelledTheme?.tagTheme.sizes.xs ?? UntravelledTagSizes(tokens: UntravelledTokens.light).xs;
      default:
        return context.untravelledTheme?.tagTheme.sizes.xs ?? UntravelledTagSizes(tokens: UntravelledTokens.light).xs;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledTagSizeProperties effectiveUntravelledTagSize = _getUntravelledTagSize(context, tagSize);

    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ?? effectiveUntravelledTagSize.borderRadius;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.tagTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveTextColor = context.untravelledTheme?.tagTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.tagTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final double effectiveHeight = height ?? effectiveUntravelledTagSize.height;

    final double effectiveGap = gap ?? effectiveUntravelledTagSize.gap;

    final EdgeInsetsGeometry effectivePadding = padding ?? effectiveUntravelledTagSize.padding;

    final EdgeInsets resolvedDirectionalPadding = effectivePadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedPadding = padding == null
        ? EdgeInsetsDirectional.fromSTEB(
            leading == null && label != null ? resolvedDirectionalPadding.left : 0,
            resolvedDirectionalPadding.top,
            trailing == null && label != null ? resolvedDirectionalPadding.right : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    return Semantics(
      label: semanticLabel,
      button: false,
      focusable: false,
      child: GestureDetector(
        excludeFromSemantics: true,
        onTap: onTap,
        onLongPress: onLongPress,
        child: MouseRegion(
          cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Container(
            height: effectiveHeight,
            padding: correctedPadding,
            constraints: BoxConstraints(minWidth: effectiveHeight),
            decoration: decoration ??
                ShapeDecorationWithPremultipliedAlpha(
                  color: effectiveBackgroundColor,
                  shape: UntravelledSquircleBorder(
                    borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                  ),
                ),
            child: IconTheme(
              data: IconThemeData(
                color: effectiveIconColor,
                size: effectiveUntravelledTagSize.iconSizeValue,
              ),
              child: DefaultTextStyle(
                style: isUpperCase
                    ? effectiveUntravelledTagSize.upperCaseTextStyle.copyWith(color: effectiveTextColor)
                    : effectiveUntravelledTagSize.textStyle.copyWith(color: effectiveTextColor),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                        child: leading,
                      ),
                    if (label != null) label!,
                    if (trailing != null)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                        child: trailing,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
