import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledModalProperties extends ThemeExtension<UntravelledModalProperties> with DiagnosticableTreeMixin {
  /// Modal border radius.
  final BorderRadiusGeometry borderRadius;

  /// Modal transition duration.
  final Duration transitionDuration;

  /// Modal transition curve.
  final Curve transitionCurve;

  /// Modal text style.
  final TextStyle textStyle;

  const UntravelledModalProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.textStyle,
  });

  @override
  UntravelledModalProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    TextStyle? textStyle,
  }) {
    return UntravelledModalProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledModalProperties lerp(ThemeExtension<UntravelledModalProperties>? other, double t) {
    if (other is! UntravelledModalProperties) return this;

    return UntravelledModalProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledModalProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
