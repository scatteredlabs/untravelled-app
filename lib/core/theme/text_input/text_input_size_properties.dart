import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTextInputSizeProperties extends ThemeExtension<UntravelledTextInputSizeProperties> with DiagnosticableTreeMixin {
  /// TextInput border radius.
  final BorderRadiusGeometry borderRadius;

  /// TextInput height.
  final double height;

  /// Space between TextInput children.
  final double gap;

  /// TextInput icon size value.
  final double iconSizeValue;

  /// Padding around TextInput children.
  final EdgeInsetsGeometry padding;

  /// TextInput text style.
  final TextStyle textStyle;

  const UntravelledTextInputSizeProperties({
    required this.borderRadius,
    required this.height,
    required this.gap,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  @override
  UntravelledTextInputSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    double? gap,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UntravelledTextInputSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      height: height ?? this.height,
      gap: gap ?? this.gap,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledTextInputSizeProperties lerp(ThemeExtension<UntravelledTextInputSizeProperties>? other, double t) {
    if (other is! UntravelledTextInputSizeProperties) return this;

    return UntravelledTextInputSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      height: lerpDouble(height, other.height, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("gap", gap))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
