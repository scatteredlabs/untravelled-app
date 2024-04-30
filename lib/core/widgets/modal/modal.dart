import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/borders.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';

/// Displays a modal above the current contents of the app, with entrance and exit animations, modal barrier color,
/// and modal barrier behavior (dialog is dismissible with a tap on the barrier). Used together with UntravelledModal.
Future<T?> showUntravelledModal<T>({
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  Color? barrierColor,
  Curve? transitionCurve,
  Duration? transitionDuration,
  Offset? anchorPoint,
  RouteSettings? routeSettings,
  String? barrierLabel = "Dismiss",
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  assert(!barrierDismissible || barrierLabel != null);
  assert(_debugIsActive(context));

  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(context, rootNavigator: useRootNavigator).context,
  );

  final Color effectiveBarrierColor =
      barrierColor ?? context.untravelledTheme?.modalTheme.colors.barrierColor ?? UntravelledColors.light.zeno;

  final Duration effectiveTransitionDuration = transitionDuration ??
      context.untravelledTheme?.modalTheme.properties.transitionDuration ??
      UntravelledTransitions.transitions.defaultTransitionDuration;

  final Curve effectiveTransitionCurve = transitionCurve ??
      context.untravelledTheme?.modalTheme.properties.transitionCurve ??
      UntravelledTransitions.transitions.defaultTransitionCurve;

  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
    UntravelledModalRoute<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: effectiveBarrierColor,
      transitionDuration: effectiveTransitionDuration,
      transitionCurve: effectiveTransitionCurve,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      anchorPoint: anchorPoint,
      themes: themes,
    ),
  );
}

bool _debugIsActive(BuildContext context) {
  if (context is Element && !context.debugIsActive) {
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary('This BuildContext is no longer valid.'),
      ErrorDescription('The showUntravelledModal function context parameter is a BuildContext that is no longer valid.'),
      ErrorHint(
        'This can commonly occur when the showUntravelledModal function is called after awaiting a Future. '
        'In this situation the BuildContext might refer to a widget that has already been disposed during the await. '
        'Consider using a parent context instead.',
      ),
    ]);
  }

  return true;
}

class UntravelledModalRoute<T> extends RawDialogRoute<T> {
  /// A MDS modal route with entrance and exit animations, modal barrier color, and modal barrier behavior
  /// (modal is dismissible with a tap on the barrier).
  UntravelledModalRoute({
    super.anchorPoint,
    required super.barrierColor,
    super.barrierDismissible,
    String? barrierLabel,
    super.settings,
    CapturedThemes? themes,
    required super.transitionDuration,
    required Curve transitionCurve,
    bool useSafeArea = true,
    required BuildContext context,
    required WidgetBuilder builder,
  }) : super(
          barrierLabel: barrierLabel ?? MaterialLocalizations.of(context).modalBarrierDismissLabel,
          pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
            final Widget pageChild = Builder(builder: builder);

            Widget modal = themes?.wrap(pageChild) ?? pageChild;

            if (useSafeArea) {
              modal = SafeArea(child: modal);
            }

            return modal;
          },
          transitionBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return RepaintBoundary(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: transitionCurve,
                ),
                child: child,
              ),
            );
          },
        );
}

class UntravelledModal extends StatelessWidget {
  /// The border radius of the modal.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the modal.
  final Color? backgroundColor;

  /// Custom decoration for the modal.
  final Decoration? decoration;

  /// The semantic label for the modal.
  final String? semanticLabel;

  /// The child of the modal.
  final Widget child;

  const UntravelledModal({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.decoration,
    this.semanticLabel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius =
        borderRadius ?? context.untravelledTheme?.modalTheme.properties.borderRadius ?? UntravelledBorders.borders.surfaceSm;

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.modalTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveTextColor = context.untravelledTheme?.modalTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.modalTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final TextStyle effectiveTextStyle =
        context.untravelledTheme?.modalTheme.properties.textStyle ?? UntravelledTypography.typography.body.textDefault;

    return Semantics(
      label: semanticLabel,
      child: IconTheme(
        data: IconThemeData(color: effectiveIconColor),
        child: DefaultTextStyle(
          style: effectiveTextStyle.copyWith(color: effectiveTextColor),
          child: Center(
            child: Container(
              decoration: decoration ??
                  ShapeDecorationWithPremultipliedAlpha(
                    color: effectiveBackgroundColor,
                    shape: UntravelledSquircleBorder(
                      borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                    ),
                  ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
