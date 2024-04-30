import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/shadows.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';

class UntravelledDrawer extends StatelessWidget {
  /// The border radius of the Drawer.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the Drawer.
  final Color? backgroundColor;

  /// The color of the Drawer barrier.
  final Color? barrierColor;

  /// Custom decoration for the Drawer.
  final Decoration? decoration;

  /// The width of the Drawer.
  final double? width;

  /// List of Drawer shadows.
  final List<BoxShadow>? drawerShadows;

  /// The semantic label for the Drawer.
  final String? semanticLabel;

  /// The child of the Drawer.
  final Widget child;

  const UntravelledDrawer({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.barrierColor,
    this.decoration,
    this.width,
    this.drawerShadows,
    this.semanticLabel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? context.untravelledTheme?.drawerTheme.properties.borderRadius ?? BorderRadius.zero;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.drawerTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveTextColor = context.untravelledTheme?.drawerTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.drawerTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final double effectiveWidthFromTheme = context.untravelledTheme?.drawerTheme.properties.width ?? 448;

    final double effectiveWidth = width ??
        (MediaQuery.of(context).size.width < effectiveWidthFromTheme
            ? MediaQuery.of(context).size.width
            : effectiveWidthFromTheme);

    final List<BoxShadow> effectiveDrawerShadows =
        drawerShadows ?? context.untravelledTheme?.drawerTheme.shadows.drawerShadows ?? UntravelledShadows.light.lg;

    final TextStyle effectiveTextStyle =
        context.untravelledTheme?.drawerTheme.properties.textStyle ?? UntravelledTypography.typography.body.textDefault;

    return Semantics(
      explicitChildNodes: true,
      namesRoute: true,
      scopesRoute: true,
      label: semanticLabel,
      child: IconTheme(
        data: IconThemeData(color: effectiveIconColor),
        child: DefaultTextStyle(
          style: effectiveTextStyle.copyWith(color: effectiveTextColor),
          child: Container(
            width: effectiveWidth,
            decoration: decoration ??
                ShapeDecorationWithPremultipliedAlpha(
                  color: effectiveBackgroundColor,
                  shadows: effectiveDrawerShadows,
                  shape: UntravelledSquircleBorder(
                    borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                  ),
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}
