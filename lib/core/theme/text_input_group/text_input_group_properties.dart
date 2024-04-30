import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTextInputGroupProperties extends ThemeExtension<UntravelledTextInputGroupProperties> with DiagnosticableTreeMixin {
  /// TextInputGroup border radius.
  final BorderRadiusGeometry borderRadius;

  /// TextInputGroup transition duration.
  final Duration transitionDuration;

  /// TextInputGroup transition curve.
  final Curve transitionCurve;

  /// The padding around TextInputGroup helper widget or error builder.
  final EdgeInsetsGeometry helperPadding;

  /// TextInputGroup text padding.
  final EdgeInsetsGeometry textPadding;

  /// TextInputGroup text style.
  final TextStyle textStyle;

  /// TextInputGroup helper or error text style.
  final TextStyle helperTextStyle;

  const UntravelledTextInputGroupProperties({
    required this.borderRadius,
    required this.transitionDuration,
    required this.transitionCurve,
    required this.helperPadding,
    required this.textPadding,
    required this.textStyle,
    required this.helperTextStyle,
  });

  @override
  UntravelledTextInputGroupProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? helperPadding,
    EdgeInsetsGeometry? textPadding,
    TextStyle? textStyle,
    TextStyle? helperTextStyle,
  }) {
    return UntravelledTextInputGroupProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      helperPadding: helperPadding ?? this.helperPadding,
      textPadding: textPadding ?? this.textPadding,
      textStyle: textStyle ?? this.textStyle,
      helperTextStyle: helperTextStyle ?? this.helperTextStyle,
    );
  }

  @override
  UntravelledTextInputGroupProperties lerp(ThemeExtension<UntravelledTextInputGroupProperties>? other, double t) {
    if (other is! UntravelledTextInputGroupProperties) return this;

    return UntravelledTextInputGroupProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      helperPadding: EdgeInsetsGeometry.lerp(helperPadding, other.helperPadding, t)!,
      textPadding: EdgeInsetsGeometry.lerp(textPadding, other.textPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      helperTextStyle: TextStyle.lerp(helperTextStyle, other.helperTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputGroupProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("helperPadding", helperPadding))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("textPadding", textPadding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle))
      ..add(DiagnosticsProperty<TextStyle>("helperTextStyle", helperTextStyle));
  }
}
