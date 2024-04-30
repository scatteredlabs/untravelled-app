import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/borders.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/sizes.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';

class UntravelledAlert extends StatefulWidget {
  /// Controls whether the alert is shown.
  final bool show;

  /// Whether the alert should show a border.
  final bool showBorder;

  /// The border radius of the alert.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the alert.
  final Color? backgroundColor;

  /// The border color of the alert.
  final Color? borderColor;

  /// The text and icon color of the alert.
  final Color? color;

  /// The border width of the alert.
  final double? borderWidth;

  /// The horizontal space between alert leading, trailing and title.
  final double? horizontalGap;

  /// The minimum height of Alert.
  final double? minimumHeight;

  /// The vertical space between alert header and body.
  final double? verticalGap;

  /// Alert transition duration (show and hide animation).
  final Duration? transitionDuration;

  /// Alert transition curve (show and hide animation).
  final Curve? transitionCurve;

  /// The padding of the alert.
  final EdgeInsetsGeometry? padding;

  /// Custom decoration for the alert.
  final Decoration? decoration;

  /// The semantic label for the alert.
  final String? semanticLabel;

  /// The widget in the leading slot of the alert.
  final Widget? leading;

  /// The widget in the title slot of the alert.
  final Widget title;

  /// The widget in the trailing slot of the alert.
  final Widget? trailing;

  /// The widget in the body slot of the alert.
  final Widget? body;

  /// MDS base alert.
  ///
  /// See also:
  ///
  ///   * [UntravelledFilledAlert], MDS filled alert.
  ///   * [UntravelledOutlinedAlert], MDS outlined alert.
  const UntravelledAlert({
    super.key,
    this.show = false,
    this.showBorder = false,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.color,
    this.borderWidth,
    this.horizontalGap,
    this.minimumHeight,
    this.verticalGap,
    this.transitionDuration,
    this.transitionCurve,
    this.padding,
    this.decoration,
    this.semanticLabel,
    this.leading,
    required this.title,
    this.trailing,
    this.body,
  });

  @override
  State<UntravelledAlert> createState() => _UntravelledAlertState();
}

class _UntravelledAlertState extends State<UntravelledAlert> with SingleTickerProviderStateMixin {
  bool _isVisible = true;

  AnimationController? _animationController;
  Animation<double>? _curvedAnimation;

  TextStyle _getTitleTextStyle({required BuildContext context}) {
    if (widget.body != null) {
      return context.untravelledTheme?.alertTheme.properties.titleTextStyle ?? UntravelledTypography.typography.heading.textDefault;
    } else {
      return context.untravelledTheme?.alertTheme.properties.bodyTextStyle ?? UntravelledTypography.typography.body.textDefault;
    }
  }

  void _showAlert() {
    _animationController!.forward();

    setState(() => _isVisible = true);
  }

  void _hideAlert() {
    _animationController!.reverse().then<void>((void value) {
      if (!mounted) return;

      setState(() => _isVisible = false);
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!mounted) return;

      if (_isVisible) _animationController!.value = 1.0;
    });
  }

  @override
  void didUpdateWidget(UntravelledAlert oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.show != widget.show) {
      widget.show ? _showAlert() : _hideAlert();
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.untravelledTheme?.alertTheme.properties.borderRadius ??
        UntravelledBorders.borders.interactiveSm;

    final double effectiveBorderWidth =
        widget.borderWidth ?? context.untravelledBorders?.defaultBorderWidth ?? UntravelledBorders.borders.defaultBorderWidth;

    final double effectiveHorizontalGap =
        widget.horizontalGap ?? context.untravelledTheme?.alertTheme.properties.horizontalGap ?? UntravelledSizes.sizes.x3s;

    final double effectiveVerticalGap =
        widget.verticalGap ?? context.untravelledTheme?.alertTheme.properties.verticalGap ?? UntravelledSizes.sizes.x4s;

    final double effectiveMinimumHeight =
        widget.minimumHeight ?? context.untravelledTheme?.alertTheme.properties.minimumHeight ?? UntravelledSizes.sizes.xl;

    final Color effectiveBackgroundColor =
        widget.backgroundColor ?? context.untravelledTheme?.alertTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveBorderColor =
        widget.borderColor ?? context.untravelledTheme?.alertTheme.colors.borderColor ?? UntravelledColors.light.bulma;

    final Color effectiveTextColor =
        widget.color ?? context.untravelledTheme?.alertTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor =
        widget.color ?? context.untravelledTheme?.alertTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final EdgeInsetsGeometry effectivePadding =
        widget.padding ?? context.untravelledTheme?.alertTheme.properties.padding ?? EdgeInsets.all(UntravelledSizes.sizes.x2s);

    final TextStyle effectiveTitleTextStyle = _getTitleTextStyle(context: context);

    final TextStyle effectiveBodyTextStyle =
        context.untravelledTheme?.alertTheme.properties.bodyTextStyle ?? UntravelledTypography.typography.body.textDefault;

    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.untravelledTheme?.alertTheme.properties.transitionDuration ??
        UntravelledTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.alertTheme.properties.transitionCurve ??
        UntravelledTransitions.transitions.defaultTransitionCurve;

    _animationController ??= AnimationController(
      duration: effectiveTransitionDuration,
      vsync: this,
    );

    _curvedAnimation ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    return Visibility(
      visible: _isVisible,
      child: Semantics(
        label: widget.semanticLabel,
        child: RepaintBoundary(
          child: FadeTransition(
            opacity: _curvedAnimation!,
            child: Container(
              padding: effectivePadding,
              constraints: BoxConstraints(minHeight: effectiveMinimumHeight),
              decoration: widget.decoration ??
                  ShapeDecorationWithPremultipliedAlpha(
                    color: effectiveBackgroundColor,
                    shape: UntravelledSquircleBorder(
                      side: BorderSide(
                        color: effectiveBorderColor,
                        width: widget.showBorder ? effectiveBorderWidth : 0,
                        style: widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                      ),
                      borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                    ),
                  ),
              child: IconTheme(
                data: IconThemeData(
                  color: effectiveIconColor,
                ),
                child: DefaultTextStyle(
                  style: effectiveBodyTextStyle.copyWith(color: effectiveTextColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          if (widget.leading != null)
                            Padding(
                              padding: EdgeInsetsDirectional.only(end: effectiveHorizontalGap),
                              child: widget.leading,
                            ),
                          DefaultTextStyle(
                            style: effectiveTitleTextStyle.copyWith(color: effectiveTextColor),
                            child: Expanded(
                              child: widget.title,
                            ),
                          ),
                          if (widget.trailing != null)
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: effectiveHorizontalGap),
                              child: widget.trailing,
                            ),
                        ],
                      ),
                      if (widget.body != null)
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(top: effectiveVerticalGap),
                                child: widget.body,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
