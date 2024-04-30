import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tab_bar/tab_bar_size_properties.dart';
import 'package:untravelled_app/core/theme/tab_bar/tab_bar_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/utils/color_tween_premul.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';
import 'package:untravelled_app/core/widgets/common/base_control.dart';
import 'package:untravelled_app/core/widgets/common/base_segmented_tab_bar.dart';
import 'package:untravelled_app/core/widgets/tab_bar/pill_tab.dart';
import 'package:untravelled_app/core/widgets/tab_bar/pill_tab_style.dart';
import 'package:untravelled_app/core/widgets/tab_bar/tab.dart';
import 'package:untravelled_app/core/widgets/tab_bar/tab_style.dart';

enum UntravelledTabBarVariant {
  indicator,
  pill,
  custom,
}

enum UntravelledTabBarSize {
  sm,
  md,
}

typedef UntravelledCustomTabBuilder = Widget Function(BuildContext context, bool isSelected);

class UntravelledTabBar extends StatefulWidget {
  /// Controls whether UntravelledTabBar is expanded and takes up all available space horizontally.
  final bool isExpanded;

  /// The gap between UntravelledTabBar children.
  final double? gap;

  /// The height of the UntravelledTabBar.
  final double? height;

  /// The width of the UntravelledTabBar.
  final double? width;

  /// Transition duration of UntravelledTabBar.
  final Duration? transitionDuration;

  /// Transition curve of UntravelledTabBar.
  final Curve? transitionCurve;

  /// The padding of the UntravelledTabBar.
  final EdgeInsetsGeometry? padding;

  /// The index of initially selected tab.
  final int selectedIndex;

  /// The size of the UntravelledTabBar.
  final UntravelledTabBarSize? tabBarSize;

  /// Custom decoration of the UntravelledTabBar.
  final Decoration? decoration;

  /// Controller of UntravelledTabBar selection and animation state.
  final TabController? tabController;

  /// Callback that returns current selected tab index.
  final ValueChanged<int>? onTabChanged;

  /// The children of UntravelledTabBar. At least one child is required.
  final List<UntravelledTab>? tabs;

  /// The children of pill UntravelledTabBar. At least one child is required.
  final List<UntravelledPillTab>? pillTabs;

  /// The children of custom UntravelledTabBar. At least one child is required.
  final List<UntravelledCustomTabBuilder>? customTabs;

  /// MDS TabBar widget.
  const UntravelledTabBar({
    super.key,
    this.isExpanded = false,
    this.gap,
    this.height,
    this.width,
    this.transitionDuration,
    this.transitionCurve,
    this.padding,
    this.selectedIndex = 0,
    this.tabBarSize,
    this.decoration,
    this.tabController,
    this.onTabChanged,
    required this.tabs,
  })  : assert(height == null || height > 0),
        assert(tabs != null && tabs.length > 0),
        pillTabs = null,
        customTabs = null;

  /// MDS pill TabBar widget.
  const UntravelledTabBar.pill({
    super.key,
    this.isExpanded = false,
    this.gap,
    this.height,
    this.width,
    this.transitionDuration,
    this.transitionCurve,
    this.padding,
    this.selectedIndex = 0,
    this.tabBarSize,
    this.decoration,
    this.tabController,
    this.onTabChanged,
    required this.pillTabs,
  })  : assert(height == null || height > 0),
        assert(pillTabs != null && pillTabs.length > 0),
        tabs = null,
        customTabs = null;

  /// MDS custom TabBar widget.
  const UntravelledTabBar.custom({
    super.key,
    this.isExpanded = false,
    this.gap,
    this.height,
    this.width,
    this.transitionDuration,
    this.transitionCurve,
    this.padding,
    this.selectedIndex = 0,
    this.tabBarSize,
    this.decoration,
    this.tabController,
    this.onTabChanged,
    required this.customTabs,
  })  : assert(height == null || height > 0),
        assert(customTabs != null && customTabs.length > 0),
        tabs = null,
        pillTabs = null;

  @override
  State<UntravelledTabBar> createState() => _UntravelledTabBarState();
}

class _UntravelledTabBarState extends State<UntravelledTabBar> {
  late int _selectedIndex = widget.selectedIndex;
  late UntravelledTabBarVariant _tabBarVariant;

  late Duration _effectiveTransitionDuration;
  late Curve _effectiveTransitionCurve;
  late UntravelledTabBarSizeProperties _effectiveUntravelledTabBarSize;

  UntravelledTabBarSizeProperties _getUntravelledTabBarSize(BuildContext context, UntravelledTabBarSize? tabBarSize) {
    switch (tabBarSize) {
      case UntravelledTabBarSize.sm:
        return context.untravelledTheme?.tabBarTheme.sizes.sm ?? UntravelledTabBarSizes(tokens: UntravelledTokens.light).sm;
      case UntravelledTabBarSize.md:
        return context.untravelledTheme?.tabBarTheme.sizes.md ?? UntravelledTabBarSizes(tokens: UntravelledTokens.light).md;
      default:
        return context.untravelledTheme?.tabBarTheme.sizes.md ?? UntravelledTabBarSizes(tokens: UntravelledTokens.light).md;
    }
  }

  void _setSelectedTabBarVariant() {
    if (widget.tabs != null) {
      _tabBarVariant = UntravelledTabBarVariant.indicator;
    } else if (widget.pillTabs != null) {
      _tabBarVariant = UntravelledTabBarVariant.pill;
    } else {
      _tabBarVariant = UntravelledTabBarVariant.custom;
    }
  }

  void _updateTabsSelectedStatus() {
    if (_tabBarVariant == UntravelledTabBarVariant.indicator) {
      widget.tabs?.asMap().forEach((int index, UntravelledTab tab) {
        tab.isSelected?.call(index == _selectedIndex);
      });
    } else if (_tabBarVariant == UntravelledTabBarVariant.pill) {
      widget.pillTabs?.asMap().forEach((int index, UntravelledPillTab pillTab) {
        pillTab.isSelected?.call(index == _selectedIndex);
      });
    } else {
      widget.customTabs?.asMap().forEach((int index, Widget Function(BuildContext, bool) customTab) {
        customTab.call(context, index == _selectedIndex);
      });
    }
  }

  List<Widget> _generateTabs() {
    switch (_tabBarVariant) {
      case UntravelledTabBarVariant.indicator:
        return _generateIndicatorTabs();
      case UntravelledTabBarVariant.pill:
        return _generatePillTabs();
      default:
        return _generateCustomTabs();
    }
  }

  @override
  void initState() {
    super.initState();

    _setSelectedTabBarVariant();
    _updateTabsSelectedStatus();
  }

  List<Widget> _generateIndicatorTabs() {
    return List.generate(
      widget.tabs!.length,
      (int index) {
        return _IndicatorTabBuilder(
          transitionDuration: _effectiveTransitionDuration,
          transitionCurve: _effectiveTransitionCurve,
          isSelected: index == _selectedIndex,
          untravelledTabBarSizeProperties: _effectiveUntravelledTabBarSize,
          tab: widget.tabs![index],
        );
      },
    );
  }

  List<Widget> _generatePillTabs() {
    return List.generate(
      widget.pillTabs!.length,
      (int index) {
        return _PillTabBuilder(
          transitionDuration: _effectiveTransitionDuration,
          transitionCurve: _effectiveTransitionCurve,
          isSelected: index == _selectedIndex,
          untravelledTabBarSizeProperties: _effectiveUntravelledTabBarSize,
          tab: widget.pillTabs![index],
        );
      },
    );
  }

  List<Widget> _generateCustomTabs() {
    return List.generate(
      widget.customTabs!.length,
      (int index) {
        return widget.customTabs![index](context, index == _selectedIndex);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _effectiveUntravelledTabBarSize = _getUntravelledTabBarSize(context, widget.tabBarSize);

    _effectiveTransitionDuration = widget.transitionDuration ??
        context.untravelledTheme?.tabBarTheme.properties.transitionDuration ??
        UntravelledTransitions.transitions.defaultTransitionDuration;

    _effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.tabBarTheme.properties.transitionCurve ??
        UntravelledTransitions.transitions.defaultTransitionCurve;

    final double effectiveHeight = widget.height ?? _effectiveUntravelledTabBarSize.height;

    final double effectiveGap = widget.gap ?? context.untravelledTheme?.tabBarTheme.properties.gap ?? UntravelledSizes.sizes.x5s;

    return Container(
      height: effectiveHeight,
      width: widget.width,
      padding: widget.padding,
      decoration: widget.decoration,
      constraints: BoxConstraints(minWidth: effectiveHeight),
      child: BaseSegmentedTabBar(
        gap: effectiveGap,
        isExpanded: widget.isExpanded,
        selectedIndex: widget.selectedIndex,
        tabController: widget.tabController,
        children: _generateTabs(),
        valueChanged: (int newIndex) {
          if (_selectedIndex == newIndex) return;
          if (widget.tabs != null && widget.tabs![newIndex].disabled) return;
          if (widget.pillTabs != null && widget.pillTabs![newIndex].disabled) return;

          widget.onTabChanged?.call(newIndex);
          _updateTabsSelectedStatus();

          setState(() => _selectedIndex = newIndex);
        },
      ),
    );
  }
}

class _IndicatorTabBuilder extends StatefulWidget {
  final bool isSelected;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final UntravelledTabBarSizeProperties untravelledTabBarSizeProperties;
  final UntravelledTab tab;

  const _IndicatorTabBuilder({
    required this.isSelected,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.untravelledTabBarSizeProperties,
    required this.tab,
  });

  @override
  State<_IndicatorTabBuilder> createState() => _IndicatorTabBuilderState();
}

class _IndicatorTabBuilderState extends State<_IndicatorTabBuilder> with SingleTickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _indicatorColorTween = ColorTweenWithPremultipliedAlpha();
  final ColorTweenWithPremultipliedAlpha _textColorTween = ColorTweenWithPremultipliedAlpha();
  final Tween<double> _indicatorWidthTween = Tween<double>(begin: 0, end: 0);

  Animation<Color?>? _indicatorColor;
  Animation<Color?>? _textColor;
  Animation<double?>? _indicatorWidth;

  AnimationController? _animationController;

  void _handleActiveEffect(bool isActive) {
    isActive ? _animationController?.forward() : _animationController?.reverse();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: widget.transitionDuration, vsync: this);

    if (widget.isSelected) _animationController?.value = 1;
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledTabStyle? tabStyle = widget.tab.tabStyle;

    final Color effectiveIndicatorColor =
        tabStyle?.indicatorColor ?? context.untravelledTheme?.tabBarTheme.colors.indicatorColor ?? UntravelledColors.light.piccolo;

    final Color effectiveTextColor = tabStyle?.textStyle?.color ??
        tabStyle?.textColor ??
        context.untravelledTheme?.tabBarTheme.colors.textColor ??
        UntravelledColors.light.textPrimary;

    final Color effectiveSelectedTextColor = tabStyle?.selectedTextColor ??
        context.untravelledTheme?.tabBarTheme.colors.selectedTextColor ??
        UntravelledColors.light.piccolo;

    final TextStyle effectiveTextStyle = widget.untravelledTabBarSizeProperties.textStyle.merge(tabStyle?.textStyle);

    final double effectiveIndicatorHeight =
        tabStyle?.indicatorHeight ?? widget.untravelledTabBarSizeProperties.indicatorHeight;

    final double effectiveTabGap = tabStyle?.tabGap ?? widget.untravelledTabBarSizeProperties.tabGap;

    final EdgeInsetsGeometry effectiveTabPadding = tabStyle?.tabPadding ?? widget.untravelledTabBarSizeProperties.tabPadding;

    final EdgeInsets resolvedDirectionalPadding = effectiveTabPadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedTabPadding = tabStyle?.tabPadding == null
        ? EdgeInsetsDirectional.fromSTEB(
            widget.tab.leading == null && widget.tab.label != null ? resolvedDirectionalPadding.left : 0,
            resolvedDirectionalPadding.top,
            widget.tab.trailing == null && widget.tab.label != null ? resolvedDirectionalPadding.right : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    _indicatorColor ??=
        _animationController!.drive(_indicatorColorTween.chain(CurveTween(curve: widget.transitionCurve)));

    _textColor ??= _animationController!.drive(_textColorTween.chain(CurveTween(curve: widget.transitionCurve)));

    _indicatorWidth ??=
        _animationController!.drive(_indicatorWidthTween.chain(CurveTween(curve: widget.transitionCurve)));

    _indicatorColorTween.end = effectiveIndicatorColor;

    _textColorTween
      ..begin = effectiveTextColor
      ..end = effectiveSelectedTextColor;

    return UntravelledBaseControl(
      semanticLabel: widget.tab.semanticLabel,
      onLongPress: widget.tab.disabled ? null : () => {},
      autofocus: widget.tab.autoFocus,
      focusNode: widget.tab.focusNode,
      isFocusable: widget.tab.isFocusable,
      showFocusEffect: widget.tab.showFocusEffect,
      focusEffectColor: tabStyle?.focusEffectColor,
      cursor: widget.isSelected ? SystemMouseCursors.basic : SystemMouseCursors.click,
      builder: (BuildContext context, bool isEnabled, bool isHovered, bool isFocused, bool isPressed) {
        final bool isActive = isEnabled && (widget.isSelected || isHovered || isPressed);

        _handleActiveEffect(isActive);

        return Container(
          decoration: tabStyle?.decoration,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _animationController!,
                builder: (BuildContext context, Widget? child) {
                  return IconTheme(
                    data: IconThemeData(
                      color: _textColor!.value,
                      size: widget.untravelledTabBarSizeProperties.iconSizeValue,
                    ),
                    child: DefaultTextStyle(
                      style: effectiveTextStyle.copyWith(color: _textColor!.value),
                      child: child!,
                    ),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: correctedTabPadding,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.tab.leading != null)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: effectiveTabGap),
                            child: widget.tab.leading,
                          ),
                        if (widget.tab.label != null)
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: widget.untravelledTabBarSizeProperties.iconSizeValue),
                            child: Center(child: widget.tab.label),
                          ),
                        if (widget.tab.trailing != null)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: effectiveTabGap),
                            child: widget.tab.trailing,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    _indicatorWidthTween.end = constraints.maxWidth;

                    return Align(
                      alignment: Directionality.of(context) == TextDirection.ltr
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      child: AnimatedBuilder(
                        animation: _animationController!,
                        builder: (BuildContext context, Widget? child) {
                          return Container(
                            color: effectiveIndicatorColor,
                            height: effectiveIndicatorHeight,
                            width: _indicatorWidth!.value,
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _PillTabBuilder extends StatefulWidget {
  final bool isSelected;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final UntravelledTabBarSizeProperties untravelledTabBarSizeProperties;
  final UntravelledPillTab tab;

  const _PillTabBuilder({
    required this.isSelected,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.untravelledTabBarSizeProperties,
    required this.tab,
  });

  @override
  State<_PillTabBuilder> createState() => _PillTabBuilderState();
}

class _PillTabBuilderState extends State<_PillTabBuilder> with SingleTickerProviderStateMixin {
  final ColorTweenWithPremultipliedAlpha _tabColorTween = ColorTweenWithPremultipliedAlpha();
  final ColorTweenWithPremultipliedAlpha _textColorTween = ColorTweenWithPremultipliedAlpha();

  Animation<Color?>? _tabColor;
  Animation<Color?>? _textColor;

  AnimationController? _animationController;

  void _handleActiveEffect(bool isActive) {
    isActive ? _animationController?.forward() : _animationController?.reverse();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: widget.transitionDuration, vsync: this);

    if (widget.isSelected) _animationController?.value = 1;
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledPillTabStyle? tabStyle = widget.tab.tabStyle;

    final BorderRadiusGeometry effectiveTabBorderRadius =
        tabStyle?.borderRadius ?? widget.untravelledTabBarSizeProperties.borderRadius;

    final Color effectiveSelectedTabColor = tabStyle?.selectedTabColor ??
        context.untravelledTheme?.tabBarTheme.colors.selectedPillTabColor ??
        UntravelledColors.light.gohan;

    final Color effectiveTextColor = tabStyle?.textStyle?.color ??
        tabStyle?.textColor ??
        context.untravelledTheme?.tabBarTheme.colors.textColor ??
        UntravelledColors.light.textPrimary;

    final Color effectiveSelectedTextColor = tabStyle?.selectedTextColor ??
        context.untravelledTheme?.tabBarTheme.colors.selectedPillTextColor ??
        UntravelledColors.light.textPrimary;

    final TextStyle effectiveTextStyle = widget.untravelledTabBarSizeProperties.textStyle.merge(tabStyle?.textStyle);

    final double effectiveTabGap = tabStyle?.tabGap ?? widget.untravelledTabBarSizeProperties.tabGap;

    final EdgeInsetsGeometry effectiveTabPadding = tabStyle?.tabPadding ?? widget.untravelledTabBarSizeProperties.tabPadding;

    final EdgeInsets resolvedDirectionalPadding = effectiveTabPadding.resolve(Directionality.of(context));

    final EdgeInsetsGeometry correctedTabPadding = tabStyle?.tabPadding == null
        ? EdgeInsetsDirectional.fromSTEB(
            widget.tab.leading == null && widget.tab.label != null ? resolvedDirectionalPadding.left : 0,
            resolvedDirectionalPadding.top,
            widget.tab.trailing == null && widget.tab.label != null ? resolvedDirectionalPadding.right : 0,
            resolvedDirectionalPadding.bottom,
          )
        : resolvedDirectionalPadding;

    _tabColor ??= _animationController!.drive(_tabColorTween.chain(CurveTween(curve: widget.transitionCurve)));

    _textColor ??= _animationController!.drive(_textColorTween.chain(CurveTween(curve: widget.transitionCurve)));

    _tabColorTween.end = effectiveSelectedTabColor;

    _textColorTween
      ..begin = effectiveTextColor
      ..end = effectiveSelectedTextColor;

    return UntravelledBaseControl(
      semanticLabel: widget.tab.semanticLabel,
      onLongPress: widget.tab.disabled ? null : () => {},
      autofocus: widget.tab.autoFocus,
      focusNode: widget.tab.focusNode,
      isFocusable: widget.tab.isFocusable,
      showFocusEffect: widget.tab.showFocusEffect,
      focusEffectColor: tabStyle?.focusEffectColor,
      borderRadius: effectiveTabBorderRadius.squircleBorderRadius(context),
      cursor: widget.isSelected ? SystemMouseCursors.basic : SystemMouseCursors.click,
      builder: (BuildContext context, bool isEnabled, bool isHovered, bool isFocused, bool isPressed) {
        final bool isActive = isEnabled && (widget.isSelected || isHovered || isPressed);

        _handleActiveEffect(isActive);

        return AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return DecoratedBox(
              decoration: tabStyle?.decoration ??
                  ShapeDecoration(
                    color: _tabColor!.value,
                    shape: UntravelledSquircleBorder(
                      borderRadius: effectiveTabBorderRadius.squircleBorderRadius(context),
                    ),
                  ),
              child: IconTheme(
                data: IconThemeData(
                  size: widget.untravelledTabBarSizeProperties.iconSizeValue,
                  color: _textColor!.value,
                ),
                child: DefaultTextStyle(
                  style: effectiveTextStyle.copyWith(color: _textColor!.value),
                  child: child!,
                ),
              ),
            );
          },
          child: Center(
            child: Padding(
              padding: correctedTabPadding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.tab.leading != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: effectiveTabGap),
                      child: widget.tab.leading,
                    ),
                  if (widget.tab.label != null) widget.tab.label!,
                  if (widget.tab.trailing != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: effectiveTabGap),
                      child: widget.tab.trailing,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
