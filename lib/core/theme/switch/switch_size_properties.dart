import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledSwitchSizeProperties extends ThemeExtension<UntravelledSwitchSizeProperties> with DiagnosticableTreeMixin {
  /// Switch height.
  final double height;

  /// Switch width.
  final double width;

  /// Switch thumb size.
  final double thumbSizeValue;

  /// Switch icon size.
  final double iconSizeValue;

  /// Switch track padding.
  final EdgeInsetsGeometry padding;

  /// Switch track text style.
  final TextStyle textStyle;

  const UntravelledSwitchSizeProperties({
    required this.height,
    required this.width,
    required this.thumbSizeValue,
    required this.iconSizeValue,
    required this.padding,
    required this.textStyle,
  });

  @override
  UntravelledSwitchSizeProperties copyWith({
    double? height,
    double? width,
    double? thumbSizeValue,
    double? iconSizeValue,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UntravelledSwitchSizeProperties(
      height: height ?? this.height,
      width: width ?? this.width,
      thumbSizeValue: thumbSizeValue ?? this.thumbSizeValue,
      iconSizeValue: iconSizeValue ?? this.iconSizeValue,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledSwitchSizeProperties lerp(ThemeExtension<UntravelledSwitchSizeProperties>? other, double t) {
    if (other is! UntravelledSwitchSizeProperties) return this;

    return UntravelledSwitchSizeProperties(
      height: lerpDouble(height, other.height, t)!,
      width: lerpDouble(width, other.width, t)!,
      thumbSizeValue: lerpDouble(thumbSizeValue, other.thumbSizeValue, t)!,
      iconSizeValue: lerpDouble(iconSizeValue, other.iconSizeValue, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSwitchSizeProperties"))
      ..add(DoubleProperty("height", height))
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("thumbSizeValue", thumbSizeValue))
      ..add(DoubleProperty("iconSizeValue", iconSizeValue))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
