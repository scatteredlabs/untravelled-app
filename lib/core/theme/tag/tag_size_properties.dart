import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTagSizeProperties extends ThemeExtension<UntravelledTagSizeProperties> with DiagnosticableTreeMixin {
  /// Tag border radius.
  final BorderRadiusGeometry borderRadius;

  /// Space between tag children.
  final double gap;

  /// Tag height.
  final double height;

  /// Tag icon size value.
  final double iconSizeValue;

  /// Padding around tag children.
  final EdgeInsetsGeometry padding;

  /// Tag body style.
  final TextStyle textStyle;

  /// Tag upper case body style.
  final TextStyle upperCaseTextStyle;

  const UntravelledTagSizeProperties({
    required this.borderRadius,
    required this.gap,
    required this.height,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
    required this.upperCaseTextStyle,
  });

  @override
  UntravelledTagSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    double? height,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    TextStyle? upperCaseTextStyle,
  }) {
    return UntravelledTagSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      upperCaseTextStyle: upperCaseTextStyle ?? this.upperCaseTextStyle,
    );
  }

  @override
  UntravelledTagSizeProperties lerp(ThemeExtension<UntravelledTagSizeProperties>? other, double t) {
    if (other is! UntravelledTagSizeProperties) return this;

    return UntravelledTagSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      upperCaseTextStyle: TextStyle.lerp(upperCaseTextStyle, other.upperCaseTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTagSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("gap", gap))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle))
      ..add(DiagnosticsProperty<TextStyle>("upperCaseTextStyle", upperCaseTextStyle));
  }
}
