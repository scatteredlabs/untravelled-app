import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledMenuItemProperties extends ThemeExtension<UntravelledMenuItemProperties> with DiagnosticableTreeMixin {
  /// MenuItem border radius.
  final BorderRadiusGeometry borderRadius;

  /// Vertical space between MenuItem title and description.
  final double verticalGap;

  /// MenuItem minimum height.
  final double minimumHeight;

  /// MenuItem padding.
  final EdgeInsetsGeometry padding;

  /// MenuItem title text style.
  final TextStyle titleTextStyle;

  /// MenuItem description text style.
  final TextStyle descriptionTextStyle;

  const UntravelledMenuItemProperties({
    required this.borderRadius,
    required this.verticalGap,
    required this.minimumHeight,
    required this.padding,
    required this.titleTextStyle,
    required this.descriptionTextStyle,
  });

  @override
  UntravelledMenuItemProperties copyWith({
    BorderRadiusGeometry? borderRadius,
    double? verticalGap,
    double? minimumHeight,
    EdgeInsetsGeometry? padding,
    TextStyle? titleTextStyle,
    TextStyle? descriptionTextStyle,
  }) {
    return UntravelledMenuItemProperties(
      borderRadius: borderRadius ?? this.borderRadius,
      verticalGap: verticalGap ?? this.verticalGap,
      minimumHeight: minimumHeight ?? this.minimumHeight,
      padding: padding ?? this.padding,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
    );
  }

  @override
  UntravelledMenuItemProperties lerp(ThemeExtension<UntravelledMenuItemProperties>? other, double t) {
    if (other is! UntravelledMenuItemProperties) return this;

    return UntravelledMenuItemProperties(
      borderRadius: BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t)!,
      verticalGap: lerpDouble(verticalGap, other.verticalGap, t)!,
      minimumHeight: lerpDouble(minimumHeight, other.minimumHeight, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      descriptionTextStyle: TextStyle.lerp(descriptionTextStyle, other.descriptionTextStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledMenuItemProperties"))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>("borderRadius", borderRadius))
      ..add(DoubleProperty("verticalGap", verticalGap))
      ..add(DoubleProperty("minimumHeight", minimumHeight))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>("padding", padding))
      ..add(DiagnosticsProperty<TextStyle>("titleTextStyle", titleTextStyle))
      ..add(DiagnosticsProperty<TextStyle>("descriptionTextStyle", descriptionTextStyle));
  }
}
