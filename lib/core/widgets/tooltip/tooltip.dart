import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/borders.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/shadows.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/widgets/tooltip/tooltip_shape.dart';

enum UntravelledTooltipPosition {
  top,
  topLeft,
  topRight,
  bottom,
  bottomLeft,
  bottomRight,
  left,
  right,
  vertical,
  horizontal,
}

class UntravelledTooltip extends StatefulWidget {
  // This is required so only one tooltip is shown at a time.
  static final List<_UntravelledTooltipState> _openedTooltips = [];

  /// Whether the tooltip has an arrow (tail).
  final bool hasArrow;

  /// Whether the tooltip should be dismissed whenever a user taps on it. For more control when to dismiss the tooltip
  /// rely on the [show] property and [onTap] handler. Defaults to [true].
  final bool hideOnTap;

  /// Controls the tooltip visibility.
  final bool show;

  /// The border radius of the tooltip.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the tooltip background.
  final Color? backgroundColor;

  /// The color of the tooltip border. Is shown when [borderWidth] is larger than 0.
  final Color borderColor;

  /// The width of the tooltip arrow (tail) at its base.
  final double? arrowBaseWidth;

  /// The length of the tooltip arrow (tail).
  final double? arrowLength;

  /// The offset of the tooltip arrow (tail) from the center of the tooltip.
  final double arrowOffsetValue;

  /// The distance from the tip of the tooltip arrow (tail) to the target widget.
  final double? arrowTipDistance;

  /// The width of the tooltip border.
  final double borderWidth;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? minHeight;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? minWidth;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? maxHeight;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? maxWidth;

  /// The margin around tooltip. Used to prevent the tooltip from touching the edges of the viewport.
  final double tooltipMargin;

  /// Tooltip transition duration (fade in or out animation).
  final Duration? transitionDuration;

  /// Tooltip transition curve (fade in or out animation).
  final Curve? transitionCurve;

  /// Padding around the tooltip content.
  final EdgeInsetsGeometry? contentPadding;

  /// List of tooltip shadows.
  final List<BoxShadow>? tooltipShadows;

  /// Sets the tooltip position relative to the target. Defaults to [UntravelledTooltipPosition.vertical]
  final UntravelledTooltipPosition tooltipPosition;

  /// `RouteObserver` used to listen for route changes that will hide the tooltip when the widget's route is not active.
  final RouteObserver<PageRoute<dynamic>>? routeObserver;

  /// The semantic label for the tooltip.
  final String? semanticLabel;

  /// Sets a handler for listening to a `tap` event on the tooltip.
  final VoidCallback? onTap;

  /// The [child] widget which the tooltip will target.
  final Widget child;

  /// The widget that its placed inside the tooltip and functions as its content.
  final Widget content;

  /// MDS tooltip widget.
  const UntravelledTooltip({
    super.key,
    this.hasArrow = true,
    this.hideOnTap = true,
    required this.show,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.arrowBaseWidth,
    this.arrowLength,
    this.arrowOffsetValue = 0,
    this.arrowTipDistance,
    this.borderWidth = 0,
    this.minHeight,
    this.minWidth,
    this.maxHeight,
    this.maxWidth,
    this.tooltipMargin = 8,
    this.transitionDuration,
    this.transitionCurve,
    this.contentPadding,
    this.tooltipShadows,
    this.tooltipPosition = UntravelledTooltipPosition.top,
    this.routeObserver,
    this.semanticLabel,
    this.onTap,
    required this.child,
    required this.content,
  });

  // Causes any current tooltips to be removed. Won't remove the supplied tooltip.
  static void _removeOtherTooltips(_UntravelledTooltipState current) {
    if (_openedTooltips.isNotEmpty) {
      // Avoid concurrent modification.
      final List<_UntravelledTooltipState> openedTooltips = _openedTooltips.toList();

      for (final _UntravelledTooltipState state in openedTooltips) {
        if (state == current) continue;

        state._clearOverlayEntry();
      }
    }
  }

  @override
  _UntravelledTooltipState createState() => _UntravelledTooltipState();
}

class _UntravelledTooltipState extends State<UntravelledTooltip> with RouteAware, SingleTickerProviderStateMixin {
  final GlobalKey _tooltipKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  AnimationController? _animationController;
  CurvedAnimation? _curvedAnimation;

  OverlayEntry? _overlayEntry;

  bool _routeIsShowing = true;

  bool get shouldShowTooltip => widget.show && _routeIsShowing;

  void _showTooltip() {
    _overlayEntry = OverlayEntry(builder: (BuildContext context) => _createOverlayContent());
    Overlay.of(context).insert(_overlayEntry!);

    UntravelledTooltip._openedTooltips.add(this);
    UntravelledTooltip._removeOtherTooltips(this);

    _animationController!.value = 0;
    _animationController!.forward();
  }

  void _updateTooltip() {
    _overlayEntry?.markNeedsBuild();
  }

  void _removeTooltip({bool immediately = false}) {
    if (immediately) {
      _clearOverlayEntry();
    } else {
      _animationController!.value = 1;
      _animationController!.reverse().then((value) => _clearOverlayEntry());
    }
  }

  void _clearOverlayEntry() {
    if (_overlayEntry != null) {
      UntravelledTooltip._openedTooltips.remove(this);
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void _handleTap(TapDownDetails details) {
    final RenderBox? tooltipRenderBox = _tooltipKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? overlayRenderBox = Overlay.of(context).context.findRenderObject() as RenderBox?;
    final Offset? tooltipPosition = tooltipRenderBox?.localToGlobal(Offset.zero, ancestor: overlayRenderBox);

    if (widget.hideOnTap ||
        tooltipPosition != null && !tooltipRenderBox!.size.contains(details.localPosition - tooltipPosition)) {
      _removeTooltip();
    }

    widget.onTap?.call();
  }

  _TooltipPositionProperties _resolveTooltipPositionParameters({
    required UntravelledTooltipPosition tooltipPosition,
    required double arrowTipDistance,
    required double arrowLength,
    required double overlayWidth,
    required double tooltipTargetGlobalLeft,
    required double tooltipTargetGlobalCenter,
    required double tooltipTargetGlobalRight,
  }) {
    switch (tooltipPosition) {
      case UntravelledTooltipPosition.top:
        return _TooltipPositionProperties(
          offset: Offset(0, -(arrowTipDistance + arrowLength)),
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          tooltipMaxWidth:
              overlayWidth - ((overlayWidth / 2 - tooltipTargetGlobalCenter) * 2).abs() - widget.tooltipMargin * 2,
        );

      case UntravelledTooltipPosition.bottom:
        return _TooltipPositionProperties(
          offset: Offset(0, arrowTipDistance + arrowLength),
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          tooltipMaxWidth:
              overlayWidth - ((overlayWidth / 2 - tooltipTargetGlobalCenter) * 2).abs() - widget.tooltipMargin * 2,
        );

      case UntravelledTooltipPosition.left:
        return _TooltipPositionProperties(
          offset: Offset(-(arrowTipDistance + arrowLength), 0),
          targetAnchor: Alignment.centerLeft,
          followerAnchor: Alignment.centerRight,
          tooltipMaxWidth: tooltipTargetGlobalLeft - arrowLength - arrowTipDistance - widget.tooltipMargin,
        );

      case UntravelledTooltipPosition.right:
        return _TooltipPositionProperties(
          offset: Offset(arrowTipDistance + arrowLength, 0),
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          tooltipMaxWidth:
              overlayWidth - tooltipTargetGlobalRight - arrowLength - arrowTipDistance - widget.tooltipMargin,
        );

      case UntravelledTooltipPosition.topLeft:
        return _TooltipPositionProperties(
          offset: Offset(0, -(arrowTipDistance + arrowLength)),
          targetAnchor: Alignment.topRight,
          followerAnchor: Alignment.bottomRight,
          tooltipMaxWidth: tooltipTargetGlobalRight - widget.tooltipMargin,
        );

      case UntravelledTooltipPosition.topRight:
        return _TooltipPositionProperties(
          offset: Offset(0, -(arrowTipDistance + arrowLength)),
          targetAnchor: Alignment.topLeft,
          followerAnchor: Alignment.bottomLeft,
          tooltipMaxWidth: overlayWidth - tooltipTargetGlobalLeft - widget.tooltipMargin,
        );

      case UntravelledTooltipPosition.bottomLeft:
        return _TooltipPositionProperties(
          offset: Offset(0, arrowTipDistance + arrowLength),
          targetAnchor: Alignment.bottomRight,
          followerAnchor: Alignment.topRight,
          tooltipMaxWidth: tooltipTargetGlobalRight - widget.tooltipMargin,
        );

      case UntravelledTooltipPosition.bottomRight:
        return _TooltipPositionProperties(
          offset: Offset(0, arrowTipDistance + arrowLength),
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          tooltipMaxWidth: overlayWidth - tooltipTargetGlobalLeft - widget.tooltipMargin,
        );

      default:
        throw AssertionError(tooltipPosition);
    }
  }

  @override
  void didPush() {
    _routeIsShowing = true;
    // Route was pushed onto navigator and is now topmost route.
    if (shouldShowTooltip) {
      _removeTooltip();

      WidgetsBinding.instance.addPostFrameCallback((Duration _) {
        if (!mounted) return;

        _showTooltip();
      });
    }
  }

  @override
  void didPushNext() {
    _routeIsShowing = false;
    _removeTooltip();
  }

  @override
  Future<void> didPopNext() async {
    _routeIsShowing = true;

    if (shouldShowTooltip) {
      // Covering route was popped off the navigator.
      _removeTooltip();

      await Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _showTooltip();
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      widget.routeObserver?.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
    });
  }

  @override
  void didUpdateWidget(UntravelledTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.routeObserver != widget.routeObserver) {
      oldWidget.routeObserver?.unsubscribe(this);
      widget.routeObserver?.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
    }

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!_routeIsShowing) return;

      if (oldWidget.tooltipPosition != widget.tooltipPosition) {
        _removeTooltip(immediately: true);
        _showTooltip();
      } else if (shouldShowTooltip && _overlayEntry == null) {
        _showTooltip();
      } else if (!shouldShowTooltip && _overlayEntry != null) {
        _removeTooltip();
      }

      _updateTooltip();
    });
  }

  @override
  void deactivate() {
    if (_overlayEntry != null) {
      _removeTooltip(immediately: true);
    }

    super.deactivate();
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _removeTooltip(immediately: true);
    }

    widget.routeObserver?.unsubscribe(this);

    super.dispose();
  }

  Widget _createOverlayContent() {
    UntravelledTooltipPosition tooltipPosition = widget.tooltipPosition;

    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.untravelledTheme?.tooltipTheme.properties.borderRadius ??
        UntravelledBorders.borders.interactiveXs;

    final resolvedBorderRadius = effectiveBorderRadius.resolve(Directionality.of(context));

    final Color effectiveBackgroundColor =
        widget.backgroundColor ?? context.untravelledTheme?.tooltipTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveTextColor = context.untravelledTheme?.tooltipTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.tooltipTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final double effectiveArrowBaseWidth =
        widget.arrowBaseWidth ?? context.untravelledTheme?.tooltipTheme.properties.arrowBaseWidth ?? 16;

    final double effectiveArrowLength =
        widget.hasArrow ? (widget.arrowLength ?? context.untravelledTheme?.tooltipTheme.properties.arrowLength ?? 8) : 0;

    final double effectiveArrowTipDistance =
        widget.arrowTipDistance ?? context.untravelledTheme?.tooltipTheme.properties.arrowTipDistance ?? 8;

    final EdgeInsetsGeometry effectiveContentPadding =
        widget.contentPadding ?? context.untravelledTheme?.tooltipTheme.properties.contentPadding ?? const EdgeInsets.all(12);

    final EdgeInsets resolvedContentPadding = effectiveContentPadding.resolve(Directionality.of(context));

    final List<BoxShadow> effectiveTooltipShadows =
        widget.tooltipShadows ?? context.untravelledTheme?.tooltipTheme.shadows.tooltipShadows ?? UntravelledShadows.light.sm;

    final TextStyle effectiveTextStyle =
        context.untravelledTheme?.tooltipTheme.properties.textStyle ?? UntravelledTypography.typography.body.text12;

    final overlayRenderBox = Overlay.of(context).context.findRenderObject()! as RenderBox;

    final targetRenderBox = context.findRenderObject()! as RenderBox;

    final tooltipTargetGlobalCenter =
        targetRenderBox.localToGlobal(targetRenderBox.size.center(Offset.zero), ancestor: overlayRenderBox);

    final tooltipTargetGlobalLeft =
        targetRenderBox.localToGlobal(targetRenderBox.size.centerLeft(Offset.zero), ancestor: overlayRenderBox);

    final tooltipTargetGlobalRight =
        targetRenderBox.localToGlobal(targetRenderBox.size.centerRight(Offset.zero), ancestor: overlayRenderBox);

    if (Directionality.of(context) == TextDirection.rtl ||
        tooltipPosition == UntravelledTooltipPosition.horizontal ||
        tooltipPosition == UntravelledTooltipPosition.vertical) {
      switch (tooltipPosition) {
        case UntravelledTooltipPosition.left:
          tooltipPosition = UntravelledTooltipPosition.right;
        case UntravelledTooltipPosition.right:
          tooltipPosition = UntravelledTooltipPosition.left;
        case UntravelledTooltipPosition.topLeft:
          tooltipPosition = UntravelledTooltipPosition.topRight;
        case UntravelledTooltipPosition.topRight:
          tooltipPosition = UntravelledTooltipPosition.topLeft;
        case UntravelledTooltipPosition.bottomLeft:
          tooltipPosition = UntravelledTooltipPosition.bottomRight;
        case UntravelledTooltipPosition.bottomRight:
          tooltipPosition = UntravelledTooltipPosition.bottomLeft;
        case UntravelledTooltipPosition.vertical:
          tooltipPosition = tooltipTargetGlobalCenter.dy < overlayRenderBox.size.center(Offset.zero).dy
              ? UntravelledTooltipPosition.bottom
              : UntravelledTooltipPosition.top;
        case UntravelledTooltipPosition.horizontal:
          tooltipPosition = tooltipTargetGlobalCenter.dx < overlayRenderBox.size.center(Offset.zero).dx
              ? UntravelledTooltipPosition.right
              : UntravelledTooltipPosition.left;
        default:
          break;
      }
    }

    final tooltipPositionParameters = _resolveTooltipPositionParameters(
      tooltipPosition: tooltipPosition,
      arrowTipDistance: effectiveArrowTipDistance,
      arrowLength: effectiveArrowLength,
      overlayWidth: overlayRenderBox.size.width,
      tooltipTargetGlobalLeft: tooltipTargetGlobalLeft.dx,
      tooltipTargetGlobalCenter: tooltipTargetGlobalCenter.dx,
      tooltipTargetGlobalRight: tooltipTargetGlobalRight.dx,
    );

    return Semantics(
      label: widget.semanticLabel,
      child: GestureDetector(
        excludeFromSemantics: true,
        behavior: HitTestBehavior.translucent,
        onTapDown: _handleTap,
        child: UnconstrainedBox(
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: tooltipPositionParameters.offset,
            followerAnchor: tooltipPositionParameters.followerAnchor,
            targetAnchor: tooltipPositionParameters.targetAnchor,
            child: RepaintBoundary(
              child: FadeTransition(
                opacity: _curvedAnimation!,
                child: DefaultTextStyle(
                  style: effectiveTextStyle.copyWith(color: effectiveTextColor),
                  child: IconTheme(
                    data: IconThemeData(color: effectiveIconColor),
                    child: Container(
                      key: _tooltipKey,
                      constraints: BoxConstraints(maxWidth: tooltipPositionParameters.tooltipMaxWidth),
                      padding: resolvedContentPadding,
                      decoration: ShapeDecorationWithPremultipliedAlpha(
                        color: effectiveBackgroundColor,
                        shadows: effectiveTooltipShadows,
                        shape: TooltipShape(
                          arrowBaseWidth: effectiveArrowBaseWidth,
                          arrowLength: effectiveArrowLength,
                          arrowOffset: widget.arrowOffsetValue,
                          arrowTipDistance: effectiveArrowTipDistance,
                          borderColor: widget.borderColor,
                          borderRadius: resolvedBorderRadius,
                          borderWidth: widget.borderWidth,
                          childWidth: targetRenderBox.size.width,
                          tooltipPosition: tooltipPosition,
                        ),
                      ),
                      child: widget.content,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.untravelledTheme?.tooltipTheme.properties.transitionDuration ??
        const Duration(milliseconds: 150);

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.tooltipTheme.properties.transitionCurve ??
        UntravelledTransitions.transitions.defaultTransitionCurve;

    _animationController ??= AnimationController(
      duration: effectiveTransitionDuration,
      vsync: this,
    );

    _curvedAnimation ??= CurvedAnimation(
      parent: _animationController!,
      curve: effectiveTransitionCurve,
    );

    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child,
    );
  }
}

class _TooltipPositionProperties {
  final Offset offset;
  final Alignment followerAnchor;
  final Alignment targetAnchor;
  final double tooltipMaxWidth;

  _TooltipPositionProperties({
    required this.offset,
    required this.followerAnchor,
    required this.targetAnchor,
    required this.tooltipMaxWidth,
  });
}
