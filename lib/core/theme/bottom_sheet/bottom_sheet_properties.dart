import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledBottomSheetProperties extends ThemeExtension<UntravelledBottomSheetProperties> with DiagnosticableTreeMixin {
  /// BottomSheet border radius.
  final BorderRadiusGeometry borderRadius;

  /// BottomSheet transition duration.
  final Duration transitionDuration;

  /// BottomSheet transition curve.
  final Curve transitionCurve;

  /// BottomSheet text style.
  final TextStyle textStyle;

  const UntravelledBottomSheetProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.textStyle,
  });

  @override
  UntravelledBottomSheetProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    TextStyle? textStyle,
  }) {
    return UntravelledBottomSheetProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledBottomSheetProperties lerp(ThemeExtension<UntravelledBottomSheetProperties>? other, double t) {
    if (other is! UntravelledBottomSheetProperties) return this;

    return UntravelledBottomSheetProperties(
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
      ..add(DiagnosticsProperty("type", "UntravelledBottomSheetProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
