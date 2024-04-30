import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/button/button_size_properties.dart';
import 'package:untravelled_app/core/theme/button/button_sizes.dart';
import 'package:untravelled_app/core/theme/effects/effects_theme.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/borders.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/utils/color_tween_premul.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';
import 'package:untravelled_app/core/widgets/common/base_control.dart';

enum UntravelledButtonSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

class UntravelledButton extends StatefulWidget {
  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether the button should be focusable.
  final bool isFocusable;

  /// Whether this button should ensure that it has a minimal touch target size.
  final bool ensureMinimalTouchTargetSize;

  /// Whether the button should be full width.
  final bool isFullWidth;

  /// Whether the button should show a border.
  final bool showBorder;

  /// Whether the button should show a focus effect.
  final bool showFocusEffect;

  /// Whether the button should show a pulse effect.
  final bool showPulseEffect;

  /// Whether the button should jiggle when the pulse effect is shown.
  final bool showPulseEffectJiggle;

  /// Whether the button should show a scale effect.
  final bool showScaleEffect;

  /// The border radius of the button.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The border color of the button.
  final Color? borderColor;

  /// The color of the focus effect.
  final Color? focusEffectColor;

  /// The color of the hover effect.
  final Color? hoverEffectColor;

  /// The color of the pulse effect.
  final Color? pulseEffectColor;

  /// The text color of the button.
  final Color? textColor;

  /// The text color of the button when hovered.
  final Color? hoverTextColor;

  /// The border width of the button.
  final double? borderWidth;

  /// The opacity value of the button when it is disabled.
  final double? disabledOpacityValue;

  /// The gap between the leading or trailing and the label widgets.
  final double? gap;

  /// The height of the button.
  final double? height;

  /// The width of the button.
  final double? width;

  /// The minimum size of the touch target.
  final double minTouchTargetSize;

  /// The extent of the focus effect.
  final double? focusEffectExtent;

  /// The extent of the pulse effect.
  final double? pulseEffectExtent;

  /// The scalar controlling the scaling of the scale effect.
  final double? scaleEffectScalar;

  /// The duration of the focus effect.
  final Duration? focusEffectDuration;

  /// The duration of the hover effect.
  final Duration? hoverEffectDuration;

  /// The duration of the pulse effect.
  final Duration? pulseEffectDuration;

  /// The duration of the scale effect.
  final Duration? scaleEffectDuration;

  /// The curve of the focus effect.
  final Curve? focusEffectCurve;

  /// The curve of the hover effect.
  final Curve? hoverEffectCurve;

  /// The curve of the pulse effect.
  final Curve? pulseEffectCurve;

  /// The curve of the scale effect.
  final Curve? scaleEffectCurve;

  /// The padding of the button.
  final EdgeInsetsGeometry? padding;

  /// {@macro flutter.widgets.Focus.focusNode}.
  final FocusNode? focusNode;

  /// The size of the button.
  final UntravelledButtonSize? buttonSize;

  /// Custom decoration for the button.
  final Decoration? decoration;

  /// The semantic label for the button.
  final String? semanticLabel;

  /// The callback that is called when the button is tapped or pressed.
  final VoidCallback? onTap;

  /// The callback that is called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The widget in the leading slot of the button.
  final Widget? leading;

  /// The widget in the label slot of the button.
  final Widget? label;

  /// The widget in the trailing slot of the button.
  final Widget? trailing;

  /// MDS base button.
  ///
  /// See also:
  ///
  ///   * [UntravelledFilledButton], MDS filled button.
  ///   * [UntravelledOutlinedButton], MDS outlined button.
  ///   * [UntravelledTextButton], MDS text button.
  const UntravelledButton({
    super.key,
    this.autofocus = false,
    this.isFocusable = true,
    this.ensureMinimalTouchTargetSize = false,
    this.isFullWidth = false,
    this.showBorder = false,
    this.showFocusEffect = true,
    this.showPulseEffect = false,
    this.showPulseEffectJiggle = true,
    this.showScaleEffect = true,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusEffectColor,
    this.hoverEffectColor,
    this.pulseEffectColor,
    this.textColor,
    this.hoverTextColor,
    this.borderWidth,
    this.disabledOpacityValue,
    this.gap,
    this.height,
    this.width,
    this.minTouchTargetSize = 40,
    this.focusEffectExtent,
    this.pulseEffectExtent,
    this.scaleEffectScalar,
    this.focusEffectDuration,
    this.hoverEffectDuration,
    this.pulseEffectDuration,
    this.scaleEffectDuration,
    this.focusEffectCurve,
    this.hoverEffectCurve,
    this.pulseEffectCurve,
    this.scaleEffectCurve,
    this.padding,
    this.focusNode,
    this.buttonSize,
    this.decoration,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.label,
    this.trailing,
  });

  /// Constructor for creating explicit icon button.
  const UntravelledButton.icon({
    super.key,
    this.autofocus = false,
    this.isFocusable = true,
    this.ensureMinimalTouchTargetSize = false,
    this.isFullWidth = false,
    this.showBorder = false,
    this.showFocusEffect = true,
    this.showPulseEffect = false,
    this.showPulseEffectJiggle = true,
    this.showScaleEffect = true,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.focusEffectColor,
    this.hoverEffectColor,
    this.pulseEffectColor,
    this.hoverTextColor,
    this.borderWidth,
    this.disabledOpacityValue,
    this.gap,
    this.height,
    this.width,
    this.minTouchTargetSize = 40,
    this.focusEffectExtent,
    this.pulseEffectExtent,
    this.scaleEffectScalar,
    this.focusEffectDuration,
    this.hoverEffectDuration,
    this.pulseEffectDuration,
    this.scaleEffectDuration,
    this.focusEffectCurve,
    this.hoverEffectCurve,
    this.pulseEffectCurve,
    this.scaleEffectCurve,
    this.padding,
    this.focusNode,
    this.buttonSize,
    this.decoration,
    this.semanticLabel,
    this.onTap,
    this.onLongPress,
    Color? iconColor,
    Widget? icon,
  })  : textColor = iconColor,
        leading = icon,
        label = null,
        trailing = null;

  @override
  State<UntravelledButton> createState() => _UntravelledButtonState();
}

class _UntravelledButtonState extends State<UntravelledButton> with SingleTickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _backgroundColorTween = ColorTweenWithPremultipliedAlpha();
  final ColorTweenWithPremultipliedAlpha _textColorTween = ColorTweenWithPremultipliedAlpha();

  Animation<Color?>? _backgroundColor;
  Animation<Color?>? _textColor;

  AnimationController? _animationController;

  bool get _isEnabled => widget.onTap != null || widget.onLongPress != null;

  void _handleHoverEffect(bool shouldAnimate) {
    shouldAnimate ? _animationController?.forward() : _animationController?.reverse();
  }

  UntravelledButtonSizeProperties _getUntravelledButtonSize(BuildContext context, UntravelledButtonSize? untravelledButtonSize) {
    switch (untravelledButtonSize) {
      case UntravelledButtonSize.xs:
        return context.untravelledTheme?.buttonTheme.sizes.xs ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).xs;
      case UntravelledButtonSize.sm:
        return context.untravelledTheme?.buttonTheme.sizes.sm ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).sm;
      case UntravelledButtonSize.md:
        return context.untravelledTheme?.buttonTheme.sizes.md ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).md;
      case UntravelledButtonSize.lg:
        return context.untravelledTheme?.buttonTheme.sizes.lg ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).lg;
      case UntravelledButtonSize.xl:
        return context.untravelledTheme?.buttonTheme.sizes.xl ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).xl;
      default:
        return context.untravelledTheme?.buttonTheme.sizes.md ?? UntravelledButtonSizes(tokens: UntravelledTokens.light).md;
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledButtonSizeProperties effectiveUntravelledButtonSize = _getUntravelledButtonSize(context, widget.buttonSize);

    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ?? effectiveUntravelledButtonSize.borderRadius;

    final Color effectiveBorderColor =
        widget.borderColor ?? context.untravelledTheme?.buttonTheme.colors.borderColor ?? UntravelledColors.light.trunks;

    final double effectiveBorderWidth =
        widget.borderWidth ?? context.untravelledBorders?.defaultBorderWidth ?? UntravelledBorders.borders.defaultBorderWidth;

    final Color effectiveTextColor =
        widget.textColor ?? context.untravelledTheme?.buttonTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveHoverEffectColor = widget.hoverEffectColor ??
        context.untravelledEffects?.controlHoverEffect.primaryHoverColor ??
        UntravelledEffectsTheme(tokens: UntravelledTokens.light).controlHoverEffect.primaryHoverColor;

    final Color hoverColor = Color.alphaBlend(effectiveHoverEffectColor, widget.backgroundColor ?? Colors.transparent);

    final double effectiveHeight = widget.height ?? effectiveUntravelledButtonSize.height;

    final double effectiveGap = widget.gap ?? effectiveUntravelledButtonSize.gap;

    final EdgeInsetsGeometry effectivePadding = widget.padding ?? effectiveUntravelledButtonSize.padding;

    final EdgeInsets resolvedDirectionalPadding = effectivePadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedPadding = widget.padding == null
        ? EdgeInsetsDirectional.fromSTEB(
            widget.leading == null && widget.label != null ? resolvedDirectionalPadding.left : 0,
            resolvedDirectionalPadding.top,
            widget.trailing == null && widget.label != null ? resolvedDirectionalPadding.right : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    final Duration effectiveHoverEffectDuration = widget.hoverEffectDuration ??
        context.untravelledEffects?.controlHoverEffect.hoverDuration ??
        UntravelledEffectsTheme(tokens: UntravelledTokens.light).controlHoverEffect.hoverDuration;

    final Curve effectiveHoverEffectCurve = widget.hoverEffectCurve ??
        context.untravelledEffects?.controlHoverEffect.hoverCurve ??
        UntravelledEffectsTheme(tokens: UntravelledTokens.light).controlHoverEffect.hoverCurve;

    _animationController ??= AnimationController(duration: effectiveHoverEffectDuration, vsync: this);

    _backgroundColor ??=
        _animationController!.drive(_backgroundColorTween.chain(CurveTween(curve: effectiveHoverEffectCurve)));

    _textColor ??= _animationController!.drive(_textColorTween.chain(CurveTween(curve: effectiveHoverEffectCurve)));

    _backgroundColorTween
      ..begin = widget.backgroundColor
      ..end = hoverColor;

    _textColorTween
      ..begin = effectiveTextColor
      ..end = widget.hoverTextColor ?? effectiveTextColor;

    return UntravelledBaseControl(
      autofocus: widget.autofocus,
      isFocusable: widget.isFocusable,
      ensureMinimalTouchTargetSize: widget.ensureMinimalTouchTargetSize,
      semanticTypeIsButton: true,
      showFocusEffect: widget.showFocusEffect,
      showPulseEffect: widget.showPulseEffect,
      showPulseEffectJiggle: widget.showPulseEffectJiggle,
      showScaleEffect: widget.showScaleEffect,
      borderRadius: effectiveBorderRadius,
      backgroundColor: widget.backgroundColor,
      focusEffectColor: widget.focusEffectColor,
      pulseEffectColor: widget.pulseEffectColor,
      disabledOpacityValue: widget.disabledOpacityValue,
      minTouchTargetSize: widget.minTouchTargetSize,
      focusEffectExtent: widget.focusEffectExtent,
      pulseEffectExtent: widget.pulseEffectExtent,
      scaleEffectScalar: widget.scaleEffectScalar,
      focusEffectDuration: widget.focusEffectDuration,
      pulseEffectDuration: widget.pulseEffectDuration,
      scaleEffectDuration: widget.scaleEffectDuration,
      focusEffectCurve: widget.focusEffectCurve,
      pulseEffectCurve: widget.pulseEffectCurve,
      scaleEffectCurve: widget.scaleEffectCurve,
      focusNode: widget.focusNode,
      semanticLabel: widget.semanticLabel,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      builder: (BuildContext context, bool isEnabled, bool isHovered, bool isFocused, bool isPressed) {
        final bool canAnimate = _isEnabled && (isHovered || isFocused || isPressed);

        _handleHoverEffect(canAnimate);

        return AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return IconTheme(
              data: IconThemeData(
                color: _textColor!.value,
                size: effectiveUntravelledButtonSize.iconSizeValue,
              ),
              child: DefaultTextStyle(
                style: effectiveUntravelledButtonSize.textStyle.copyWith(color: _textColor!.value),
                child: Container(
                  width: widget.width,
                  height: effectiveHeight,
                  constraints: BoxConstraints(minWidth: effectiveHeight),
                  decoration: widget.decoration ??
                      ShapeDecoration(
                        color: _backgroundColor!.value,
                        shape: UntravelledSquircleBorder(
                          borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                          side: BorderSide(
                            color: effectiveBorderColor,
                            width: widget.showBorder ? effectiveBorderWidth : 0,
                            style: widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                          ),
                        ),
                      ),
                  child: child,
                ),
              ),
            );
          },
          child: Padding(
            padding: widget.isFullWidth ? EdgeInsets.zero : correctedPadding,
            child: widget.isFullWidth
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      if (widget.leading != null)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: effectiveGap),
                          alignment: Directionality.of(context) == TextDirection.ltr
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: widget.leading,
                        ),
                      if (widget.label != null)
                        Align(
                          child: widget.label,
                        ),
                      if (widget.trailing != null)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: effectiveGap),
                          alignment: Directionality.of(context) == TextDirection.ltr
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: widget.trailing,
                        ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.leading != null)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                          child: widget.leading,
                        ),
                      if (widget.label != null) widget.label!,
                      if (widget.trailing != null)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: effectiveGap),
                          child: widget.trailing,
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
