import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/shadows.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';

enum UntravelledPopoverPosition {
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

class UntravelledPopover extends StatefulWidget {
  // This is required so only one popover is shown at a time.
  static final List<UntravelledPopoverState> _openedPopovers = [];

  /// Controls the popover visibility.
  final bool show;

  /// The border radius of the popover.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the popover background.
  final Color? backgroundColor;

  /// The color of the popover border.
  final Color borderColor;

  /// The width of the popover border.
  final double borderWidth;

  /// The distance from the tip of the popover arrow (tail) to the target widget.
  final double? distanceToTarget;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? minHeight;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? minWidth;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? maxHeight;

  /// Optional size constraint. If a constraint is not set the size will adjust to the content.
  final double? maxWidth;

  /// The margin around popover. Used to prevent the popover from touching the edges of the viewport.
  final double popoverMargin;

  /// Popover transition duration (fade in or out animation).
  final Duration? transitionDuration;

  /// Popover transition curve (fade in or out animation).
  final Curve? transitionCurve;

  /// Padding around the popover content.
  final EdgeInsetsGeometry? contentPadding;

  /// List of popover shadows.
  final List<BoxShadow>? popoverShadows;

  /// Sets the popover position relative to the target. Defaults to [UntravelledPopoverPosition.vertical]
  final UntravelledPopoverPosition popoverPosition;

  /// `RouteObserver` used to listen for route changes that will hide the popover when the widget's route is not active.
  final RouteObserver<PageRoute<dynamic>>? routeObserver;

  /// Custom decoration for the popover.
  final Decoration? decoration;

  /// The semantic label for the popover.
  final String? semanticLabel;

  /// The [child] widget which the popover will target.
  final Widget child;

  /// The widget that its placed inside the popover and functions as its content.
  final Widget content;

  /// MDS popover widget.
  const UntravelledPopover({
    super.key,
    required this.show,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.distanceToTarget,
    this.minHeight,
    this.minWidth,
    this.maxHeight,
    this.maxWidth,
    this.popoverMargin = 8,
    this.transitionDuration,
    this.transitionCurve,
    this.contentPadding,
    this.popoverShadows,
    this.popoverPosition = UntravelledPopoverPosition.top,
    this.routeObserver,
    this.decoration,
    this.semanticLabel,
    required this.child,
    required this.content,
  });

  // Causes any current popovers to be removed. Won't remove the supplied popover.
  static void _removeOtherPopovers(UntravelledPopoverState current) {
    if (_openedPopovers.isNotEmpty) {
      // Avoid concurrent modification.
      final List<UntravelledPopoverState> openedPopovers = _openedPopovers.toList();

      for (final UntravelledPopoverState state in openedPopovers) {
        if (state == current) continue;

        state._clearOverlayEntry();
      }
    }
  }

  @override
  UntravelledPopoverState createState() => UntravelledPopoverState();
}

class UntravelledPopoverState extends State<UntravelledPopover> with RouteAware, SingleTickerProviderStateMixin {
  final GlobalKey _popoverKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  AnimationController? _animationController;
  CurvedAnimation? _curvedAnimation;

  OverlayEntry? _overlayEntry;

  bool _routeIsShowing = true;

  bool get shouldShowPopover => widget.show && _routeIsShowing;

  void _showPopover() {
    _overlayEntry = OverlayEntry(builder: (BuildContext context) => _createOverlayContent());
    Overlay.of(context).insert(_overlayEntry!);

    UntravelledPopover._openedPopovers.add(this);
    UntravelledPopover._removeOtherPopovers(this);

    _animationController!.value = 0;
    _animationController!.forward();
  }

  void _updatePopover() {
    _overlayEntry?.markNeedsBuild();
  }

  void _removePopover({bool immediately = false}) {
    if (immediately) {
      _clearOverlayEntry();
    } else {
      _animationController!.value = 1;
      _animationController!.reverse().then((value) => _clearOverlayEntry());
    }
  }

  void _clearOverlayEntry() {
    if (_overlayEntry != null) {
      UntravelledPopover._openedPopovers.remove(this);
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  _PopoverPositionProperties _resolvePopoverPositionParameters({
    required UntravelledPopoverPosition popoverPosition,
    required double distanceToTarget,
    required double overlayWidth,
    required double popoverTargetGlobalLeft,
    required double popoverTargetGlobalCenter,
    required double popoverTargetGlobalRight,
  }) {
    switch (popoverPosition) {
      case UntravelledPopoverPosition.top:
        return _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          popoverMaxWidth:
              overlayWidth - ((overlayWidth / 2 - popoverTargetGlobalCenter) * 2).abs() - widget.popoverMargin * 2,
        );

      case UntravelledPopoverPosition.bottom:
        return _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          popoverMaxWidth:
              overlayWidth - ((overlayWidth / 2 - popoverTargetGlobalCenter) * 2).abs() - widget.popoverMargin * 2,
        );

      case UntravelledPopoverPosition.left:
        return _PopoverPositionProperties(
          offset: Offset(-distanceToTarget, 0),
          targetAnchor: Alignment.centerLeft,
          followerAnchor: Alignment.centerRight,
          popoverMaxWidth: popoverTargetGlobalLeft - distanceToTarget - widget.popoverMargin,
        );

      case UntravelledPopoverPosition.right:
        return _PopoverPositionProperties(
          offset: Offset(distanceToTarget, 0),
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          popoverMaxWidth: overlayWidth - popoverTargetGlobalRight - distanceToTarget - widget.popoverMargin,
        );

      case UntravelledPopoverPosition.topLeft:
        return _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topRight,
          followerAnchor: Alignment.bottomRight,
          popoverMaxWidth: popoverTargetGlobalRight - widget.popoverMargin,
        );

      case UntravelledPopoverPosition.topRight:
        return _PopoverPositionProperties(
          offset: Offset(0, -distanceToTarget),
          targetAnchor: Alignment.topLeft,
          followerAnchor: Alignment.bottomLeft,
          popoverMaxWidth: overlayWidth - popoverTargetGlobalLeft - widget.popoverMargin,
        );

      case UntravelledPopoverPosition.bottomLeft:
        return _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomRight,
          followerAnchor: Alignment.topRight,
          popoverMaxWidth: popoverTargetGlobalRight - widget.popoverMargin,
        );

      case UntravelledPopoverPosition.bottomRight:
        return _PopoverPositionProperties(
          offset: Offset(0, distanceToTarget),
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.topLeft,
          popoverMaxWidth: overlayWidth - popoverTargetGlobalLeft - widget.popoverMargin,
        );

      default:
        throw AssertionError(popoverPosition);
    }
  }

  @override
  void didPush() {
    _routeIsShowing = true;
    // Route was pushed onto navigator and is now topmost route.
    if (shouldShowPopover) {
      _removePopover();

      WidgetsBinding.instance.addPostFrameCallback((Duration _) {
        if (!mounted) return;

        _showPopover();
      });
    }
  }

  @override
  void didPushNext() {
    _routeIsShowing = false;

    _removePopover();
  }

  @override
  Future<void> didPopNext() async {
    _routeIsShowing = true;

    if (shouldShowPopover) {
      // Covering route was popped off the navigator.
      _removePopover();

      await Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _showPopover();
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
  void didUpdateWidget(UntravelledPopover oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.routeObserver != widget.routeObserver) {
      oldWidget.routeObserver?.unsubscribe(this);
      widget.routeObserver?.subscribe(this, ModalRoute.of(context)! as PageRoute<dynamic>);
    }

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!_routeIsShowing) return;

      if (oldWidget.popoverPosition != widget.popoverPosition) {
        _removePopover(immediately: true);
        _showPopover();
      } else if (shouldShowPopover && _overlayEntry == null) {
        _showPopover();
      } else if (!shouldShowPopover && _overlayEntry != null) {
        _removePopover();
      }

      _updatePopover();
    });
  }

  @override
  void deactivate() {
    if (_overlayEntry != null) _removePopover(immediately: true);

    super.deactivate();
  }

  @override
  void dispose() {
    if (_overlayEntry != null) _removePopover(immediately: true);

    widget.routeObserver?.unsubscribe(this);

    super.dispose();
  }

  Widget _createOverlayContent() {
    UntravelledPopoverPosition popoverPosition = widget.popoverPosition;

    final BorderRadiusGeometry effectiveBorderRadius =
        widget.borderRadius ?? context.untravelledTheme?.popoverTheme.properties.borderRadius ?? BorderRadius.circular(12);

    final Color effectiveBackgroundColor =
        widget.backgroundColor ?? context.untravelledTheme?.popoverTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveTextColor = context.untravelledTheme?.popoverTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.popoverTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final TextStyle effectiveTextStyle =
        context.untravelledTheme?.popoverTheme.properties.textStyle ?? UntravelledTypography.typography.body.textDefault;

    final double effectiveDistanceToTarget =
        widget.distanceToTarget ?? context.untravelledTheme?.popoverTheme.properties.distanceToTarget ?? 8;

    final EdgeInsetsGeometry effectiveContentPadding =
        widget.contentPadding ?? context.untravelledTheme?.popoverTheme.properties.contentPadding ?? const EdgeInsets.all(12);

    final EdgeInsets resolvedContentPadding = effectiveContentPadding.resolve(Directionality.of(context));

    final List<BoxShadow> effectivePopoverShadows =
        widget.popoverShadows ?? context.untravelledTheme?.popoverTheme.shadows.popoverShadows ?? UntravelledShadows.light.sm;

    final overlayRenderBox = Overlay.of(context).context.findRenderObject()! as RenderBox;

    final targetRenderBox = context.findRenderObject()! as RenderBox;

    final popoverTargetGlobalCenter =
        targetRenderBox.localToGlobal(targetRenderBox.size.center(Offset.zero), ancestor: overlayRenderBox);

    final popoverTargetGlobalLeft =
        targetRenderBox.localToGlobal(targetRenderBox.size.centerLeft(Offset.zero), ancestor: overlayRenderBox);

    final popoverTargetGlobalRight =
        targetRenderBox.localToGlobal(targetRenderBox.size.centerRight(Offset.zero), ancestor: overlayRenderBox);

    if (Directionality.of(context) == TextDirection.rtl ||
        popoverPosition == UntravelledPopoverPosition.horizontal ||
        popoverPosition == UntravelledPopoverPosition.vertical) {
      switch (popoverPosition) {
        case UntravelledPopoverPosition.left:
          popoverPosition = UntravelledPopoverPosition.right;
        case UntravelledPopoverPosition.right:
          popoverPosition = UntravelledPopoverPosition.left;
        case UntravelledPopoverPosition.topLeft:
          popoverPosition = UntravelledPopoverPosition.topRight;
        case UntravelledPopoverPosition.topRight:
          popoverPosition = UntravelledPopoverPosition.topLeft;
        case UntravelledPopoverPosition.bottomLeft:
          popoverPosition = UntravelledPopoverPosition.bottomRight;
        case UntravelledPopoverPosition.bottomRight:
          popoverPosition = UntravelledPopoverPosition.bottomLeft;
        case UntravelledPopoverPosition.vertical:
          popoverPosition = popoverTargetGlobalCenter.dy < overlayRenderBox.size.center(Offset.zero).dy
              ? UntravelledPopoverPosition.bottom
              : UntravelledPopoverPosition.top;
        case UntravelledPopoverPosition.horizontal:
          popoverPosition = popoverTargetGlobalCenter.dx < overlayRenderBox.size.center(Offset.zero).dx
              ? UntravelledPopoverPosition.right
              : UntravelledPopoverPosition.left;
        default:
          break;
      }
    }

    final popoverPositionParameters = _resolvePopoverPositionParameters(
      popoverPosition: popoverPosition,
      distanceToTarget: effectiveDistanceToTarget,
      overlayWidth: overlayRenderBox.size.width,
      popoverTargetGlobalLeft: popoverTargetGlobalLeft.dx,
      popoverTargetGlobalCenter: popoverTargetGlobalCenter.dx,
      popoverTargetGlobalRight: popoverTargetGlobalRight.dx,
    );

    return Semantics(
      label: widget.semanticLabel,
      child: UnconstrainedBox(
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: popoverPositionParameters.offset,
          followerAnchor: popoverPositionParameters.followerAnchor,
          targetAnchor: popoverPositionParameters.targetAnchor,
          child: TapRegion(
            behavior: HitTestBehavior.translucent,
            onTapOutside: (PointerDownEvent _) => _removePopover(),
            child: RepaintBoundary(
              child: FadeTransition(
                opacity: _curvedAnimation!,
                child: IconTheme(
                  data: IconThemeData(color: effectiveIconColor),
                  child: DefaultTextStyle(
                    style: effectiveTextStyle.copyWith(color: effectiveTextColor),
                    child: Container(
                      key: _popoverKey,
                      constraints: BoxConstraints(maxWidth: popoverPositionParameters.popoverMaxWidth),
                      padding: resolvedContentPadding,
                      decoration: widget.decoration ??
                          ShapeDecorationWithPremultipliedAlpha(
                            color: effectiveBackgroundColor,
                            shadows: effectivePopoverShadows,
                            shape: UntravelledSquircleBorder(
                              borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                              side: BorderSide(color: widget.borderColor),
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
        context.untravelledTheme?.popoverTheme.properties.transitionDuration ??
        UntravelledTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.popoverTheme.properties.transitionCurve ??
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

class _PopoverPositionProperties {
  final Alignment followerAnchor;
  final Alignment targetAnchor;
  final double popoverMaxWidth;
  final Offset offset;

  _PopoverPositionProperties({
    required this.followerAnchor,
    required this.targetAnchor,
    required this.popoverMaxWidth,
    required this.offset,
  });
}
