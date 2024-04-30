import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledPopoverProperties extends ThemeExtension<UntravelledPopoverProperties> with DiagnosticableTreeMixin {
  /// Popover border radius.
  final BorderRadiusGeometry borderRadius;

  /// Popover distance to target child widget.
  final double distanceToTarget;

  /// Popover transition duration (fade in or out animation).
  final Duration transitionDuration;

  /// Popover transition curve (fade in or out animation).
  final Curve transitionCurve;

  /// Padding around popover content.
  final EdgeInsetsGeometry contentPadding;

  /// Popover text style.
  final TextStyle textStyle;

  const UntravelledPopoverProperties({
    required this.borderRadius,
    required this.distanceToTarget,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.contentPadding,
    required this.textStyle,
  });

  @override
  UntravelledPopoverProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? distanceToTarget,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? textStyle,
  }) {
    return UntravelledPopoverProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      distanceToTarget: distanceToTarget ?? this.distanceToTarget,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledPopoverProperties lerp(ThemeExtension<UntravelledPopoverProperties>? other, double t) {
    if (other is! UntravelledPopoverProperties) return this;

    return UntravelledPopoverProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      distanceToTarget: lerpDouble(distanceToTarget, other.distanceToTarget, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      contentPadding: EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledPopoverProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("distanceToTarget", distanceToTarget))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("contentPadding", contentPadding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
