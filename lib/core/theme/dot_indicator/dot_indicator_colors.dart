import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledDotIndicatorColors extends ThemeExtension<UntravelledDotIndicatorColors> with DiagnosticableTreeMixin {
  /// Selected DotIndicator dot color.
  final Color selectedColor;

  /// Unselected DotIndicator dot color.
  final Color unselectedColor;

  const UntravelledDotIndicatorColors({
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  UntravelledDotIndicatorColors copyWith({
    Color? selectedColor,
    Color? unselectedColor,
  }) {
    return UntravelledDotIndicatorColors(
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
    );
  }

  @override
  UntravelledDotIndicatorColors lerp(ThemeExtension<UntravelledDotIndicatorColors>? other, double t) {
    if (other is! UntravelledDotIndicatorColors) return this;

    return UntravelledDotIndicatorColors(
      selectedColor: colorPremulLerp(selectedColor, other.selectedColor, t)!,
      unselectedColor: colorPremulLerp(unselectedColor, other.unselectedColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledDotIndicatorColors"))
      ..add(ColorProperty("selectedColor", selectedColor))
      ..add(ColorProperty("unselectedColor", unselectedColor));
  }
}
