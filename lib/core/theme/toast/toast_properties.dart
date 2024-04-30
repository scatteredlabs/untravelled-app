import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledToastProperties extends ThemeExtension<UntravelledToastProperties> with DiagnosticableTreeMixin {
  /// Toast border radius.
  final BorderRadiusGeometry borderRadius;

  /// Space between toast children.
  final double gap;

  /// Toast display duration.
  final Duration displayDuration;

  /// Toast transition duration.
  final Duration transitionDuration;

  /// Toast transition curve.
  final Curve transitionCurve;

  /// Padding around toast content.
  final EdgeInsetsGeometry contentPadding;

  /// Toast text style.
  final TextStyle textStyle;

  const UntravelledToastProperties({
    required this.borderRadius,
    required this.gap,
    required this.displayDuration,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.contentPadding,
    required this.textStyle,
  });

  @override
  UntravelledToastProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    Duration? displayDuration,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? textStyle,
  }) {
    return UntravelledToastProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      displayDuration: displayDuration ?? this.displayDuration,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      contentPadding: contentPadding ?? this.contentPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledToastProperties lerp(ThemeExtension<UntravelledToastProperties>? other, double t) {
    if (other is! UntravelledToastProperties) return this;

    return UntravelledToastProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      displayDuration: lerpDuration(displayDuration, other.displayDuration, t),
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
      ..add(DiagnosticsProperty("type", "UntravelledToastProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("gap", gap))
      ..add(DiagnosticsProperty<Duration>("displayDuration", displayDuration))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("contentPadding", contentPadding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
