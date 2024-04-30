import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTabBarSizeProperties extends ThemeExtension<UntravelledTabBarSizeProperties> with DiagnosticableTreeMixin {
  /// TabBar pill tab border radius.
  final BorderRadiusGeometry borderRadius;

  /// TabBar height.
  final double height;

  /// TabBar tab icon size value.
  final double iconSizeValue;

  /// TabBar tab indicator height.
  final double indicatorHeight;

  /// Gap between leading, label and trailing widgets of tab.
  final double tabGap;

  /// TabBar tab padding.
  final EdgeInsetsGeometry tabPadding;

  /// TabBar default text style.
  final TextStyle textStyle;

  const UntravelledTabBarSizeProperties({
    required this.borderRadius,
    required this.height,
    required this.iconSizeValue,
    required this.indicatorHeight,
    required this.tabGap,
    required this.tabPadding,
    required this.textStyle,
  });

  @override
  UntravelledTabBarSizeProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? height,
    double? iconSizeValue,
    double? indicatorHeight,
    double? tabGap,
    EdgeInsetsGeometry? tabPadding,
    TextStyle? textStyle,
  }) {
    return UntravelledTabBarSizeProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      height: height ?? this.height,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      indicatorHeight: indicatorHeight ?? this.indicatorHeight,
      tabGap: tabGap ?? this.tabGap,
      tabPadding: tabPadding ?? this.tabPadding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledTabBarSizeProperties lerp(ThemeExtension<UntravelledTabBarSizeProperties>? other, double t) {
    if (other is! UntravelledTabBarSizeProperties) return this;

    return UntravelledTabBarSizeProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      indicatorHeight: lerpDouble(indicatorHeight, other.indicatorHeight, t)!,
      tabGap: lerpDouble(tabGap, other.tabGap, t)!,
      tabPadding: EdgeInsetsGeometry.lerp(tabPadding, other.tabPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTabBarSizeProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DoubleProperty("indicatorHeight", indicatorHeight))
      ..add(DoubleProperty("tabGap", tabGap))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("tabPadding", tabPadding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
