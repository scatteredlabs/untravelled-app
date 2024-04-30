import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledChipSizeProperties extends ThemeExtension<UntravelledChipSizeProperties> with DiagnosticableTreeMixin {
  /// Chip border radius.
  final BorderRadiusGeometry borderRadius;

  /// Space between chip children.
  final double gap;

  /// Chip height.
  final double height;

  /// Chip icon size value.
  final double iconSizeValue;

  /// Padding around chip children.
  final EdgeInsetsGeometry padding;

  /// Chip text style.
  final TextStyle textStyle;

  const UntravelledChipSizeProperties({
    required this.borderRadius,
    required this.gap,
    required this.height,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  @override
  UntravelledChipSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? gap,
    double? height,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UntravelledChipSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      gap: gap ?? this.gap,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledChipSizeProperties lerp(ThemeExtension<UntravelledChipSizeProperties>? other, double t) {
    if (other is! UntravelledChipSizeProperties) return this;

    return UntravelledChipSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      gap: lerpDouble(gap, other.gap, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledChipSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("gap", gap))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
