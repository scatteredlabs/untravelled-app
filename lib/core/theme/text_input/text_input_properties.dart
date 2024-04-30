import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTextInputProperties extends ThemeExtension<UntravelledTextInputProperties> with DiagnosticableTreeMixin {
  /// TextInput transition duration.
  final Duration transitionDuration;

  /// TextInput transition curve.
  final Curve transitionCurve;

  /// The padding around TextInput helper widget or error builder.
  final EdgeInsetsGeometry helperPadding;

  /// TextInput helper or error text style.
  final TextStyle helperTextStyle;

  const UntravelledTextInputProperties({
    required this.transitionDuration,
    required this.transitionCurve,
    required this.helperPadding,
    required this.helperTextStyle,
  });

  @override
  UntravelledTextInputProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
    EdgeInsetsGeometry? helperPadding,
    TextStyle? helperTextStyle,
  }) {
    return UntravelledTextInputProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      helperPadding: helperPadding ?? this.helperPadding,
      helperTextStyle: helperTextStyle ?? this.helperTextStyle,
    );
  }

  @override
  UntravelledTextInputProperties lerp(ThemeExtension<UntravelledTextInputProperties>? other, double t) {
    if (other is! UntravelledTextInputProperties) return this;

    return UntravelledTextInputProperties(
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
      helperPadding: EdgeInsetsGeometry.lerp(helperPadding, other.helperPadding, t)!,
      helperTextStyle: TextStyle.lerp(helperTextStyle, other.helperTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputProperties"))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("helperPadding", helperPadding))
      ..add(DiagnosticsProperty<TextStyle>("helperTextStyle", helperTextStyle));
  }
}
