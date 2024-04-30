import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/sizes.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/utils/color_tween_premul.dart';

class UntravelledDotIndicator extends StatefulWidget {
  /// The color of the selected dot.
  final Color? selectedColor;

  /// The color of the unselected dots.
  final Color? unselectedColor;

  /// The gap between each dot.
  final double? gap;

  /// The size of each dot.
  final double? size;

  /// Indicator transition duration.
  final Duration? transitionDuration;

  /// Indicator transition curve.
  final Curve? transitionCurve;

  /// The index of the currently selected dot.
  final int selectedDot;

  /// The total number of dots.
  final int dotCount;

  /// MDS DotIndicator widget
  const UntravelledDotIndicator({
    this.selectedColor,
    this.unselectedColor,
    this.gap,
    this.size,
    this.transitionDuration,
    this.transitionCurve,
    required this.selectedDot,
    required this.dotCount,
  });

  @override
  _CarouselIndicatorState createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<UntravelledDotIndicator> with TickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _dotColorTween = ColorTweenWithPremultipliedAlpha();

  List<AnimationController>? _animationControllers;
  List<Animation<Color?>>? _animations;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      _animationControllers![widget.selectedDot].forward();
    });
  }

  @override
  void didUpdateWidget(UntravelledDotIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedDot != oldWidget.selectedDot) {
      _animationControllers![oldWidget.selectedDot].reverse();
      _animationControllers![widget.selectedDot].forward();
    }
  }

  @override
  void dispose() {
    for (final controller in _animationControllers!) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double effectiveSize =
        widget.size ?? context.untravelledTheme?.dotIndicatorTheme.properties.size ?? UntravelledSizes.sizes.x4s;

    final double effectiveGap =
        widget.gap ?? context.untravelledTheme?.dotIndicatorTheme.properties.gap ?? UntravelledSizes.sizes.x4s;

    final Color effectiveSelectedColor =
        widget.selectedColor ?? context.untravelledTheme?.dotIndicatorTheme.colors.selectedColor ?? UntravelledColors.light.piccolo;

    final Color effectiveUnselectedColor = widget.unselectedColor ??
        context.untravelledTheme?.dotIndicatorTheme.colors.unselectedColor ??
        UntravelledColors.light.beerus;

    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.untravelledTheme?.dotIndicatorTheme.properties.transitionDuration ??
        UntravelledTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.dotIndicatorTheme.properties.transitionCurve ??
        UntravelledTransitions.transitions.defaultTransitionCurve;

    _animationControllers ??= List.generate(
      widget.dotCount,
      (index) => AnimationController(
        duration: effectiveTransitionDuration,
        vsync: this,
      ),
    );

    _animations ??= List.generate(
      widget.dotCount,
      (index) => _animationControllers![index].drive(_dotColorTween.chain(CurveTween(curve: effectiveTransitionCurve))),
    );

    _dotColorTween
      ..begin = effectiveUnselectedColor
      ..end = effectiveSelectedColor;

    return RepaintBoundary(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          widget.dotCount,
          (int index) => AnimatedBuilder(
            animation: _animations![index],
            builder: (BuildContext context, Widget? _) {
              return Container(
                width: effectiveSize,
                height: effectiveSize,
                margin: EdgeInsets.symmetric(horizontal: effectiveGap / 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _animations![index].value,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
