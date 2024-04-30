import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledCheckboxProperties extends ThemeExtension<UntravelledCheckboxProperties> with DiagnosticableTreeMixin {
  /// Checkbox border radius.
  final BorderRadiusGeometry borderRadius;

  /// Checkbox text style.
  final TextStyle textStyle;

  const UntravelledCheckboxProperties({
    required this.borderRadius,
    required this.textStyle,
  });

  @override
  UntravelledCheckboxProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    TextStyle? textStyle,
  }) {
    return UntravelledCheckboxProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledCheckboxProperties lerp(ThemeExtension<UntravelledCheckboxProperties>? other, double t) {
    if (other is! UntravelledCheckboxProperties) return this;

    return UntravelledCheckboxProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCheckboxProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
