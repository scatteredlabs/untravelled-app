import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledTabBarColors extends ThemeExtension<UntravelledTabBarColors> with DiagnosticableTreeMixin {
  /// TabBar tab indicator color.
  final Color indicatorColor;

  /// TabBar default text color.
  final Color textColor;

  /// TabBar selected tab text color.
  final Color selectedTextColor;

  /// TabBar selected pill tab text color.
  final Color selectedPillTextColor;

  /// TabBar selected pill tab color.
  final Color selectedPillTabColor;

  const UntravelledTabBarColors({
    required this.indicatorColor,
    required this.textColor,
    required this.selectedTextColor,
    required this.selectedPillTextColor,
    required this.selectedPillTabColor,
  });

  @override
  UntravelledTabBarColors copyWith({
    Color? indicatorColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? selectedPillTextColor,
    Color? selectedPillTabColor,
  }) {
    return UntravelledTabBarColors(
      indicatorColor: indicatorColor ?? this.indicatorColor,
      textColor: textColor ?? this.textColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      selectedPillTextColor: selectedPillTextColor ?? this.selectedPillTextColor,
      selectedPillTabColor: selectedPillTabColor ?? this.selectedPillTabColor,
    );
  }

  @override
  UntravelledTabBarColors lerp(ThemeExtension<UntravelledTabBarColors>? other, double t) {
    if (other is! UntravelledTabBarColors) return this;

    return UntravelledTabBarColors(
      indicatorColor: colorPremulLerp(indicatorColor, other.indicatorColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      selectedTextColor: colorPremulLerp(selectedTextColor, other.selectedTextColor, t)!,
      selectedPillTextColor: colorPremulLerp(selectedPillTextColor, other.selectedPillTextColor, t)!,
      selectedPillTabColor: colorPremulLerp(selectedPillTabColor, other.selectedPillTabColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTabBarColors"))
      ..add(ColorProperty("indicatorColor", indicatorColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("selectedTextColor", selectedTextColor))
      ..add(ColorProperty("selectedPillTextColor", selectedPillTextColor))
      ..add(ColorProperty("selectedPillTabColor", selectedPillTabColor));
  }
}
