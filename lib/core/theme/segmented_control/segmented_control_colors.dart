import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledSegmentedControlColors extends ThemeExtension<UntravelledSegmentedControlColors> with DiagnosticableTreeMixin {
  /// Background color of SegmentedControl.
  final Color backgroundColor;

  /// Color of selected segment.
  final Color selectedSegmentColor;

  /// Default text color of segments.
  final Color textColor;

  /// Text color of selected segment.
  final Color selectedTextColor;

  const UntravelledSegmentedControlColors({
    required this.backgroundColor,
    required this.selectedSegmentColor,
    required this.textColor,
    required this.selectedTextColor,
  });

  @override
  UntravelledSegmentedControlColors copyWith({
    Color? backgroundColor,
    Color? selectedSegmentColor,
    Color? textColor,
    Color? selectedTextColor,
  }) {
    return UntravelledSegmentedControlColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedSegmentColor: selectedSegmentColor ?? this.selectedSegmentColor,
      textColor: textColor ?? this.textColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
    );
  }

  @override
  UntravelledSegmentedControlColors lerp(ThemeExtension<UntravelledSegmentedControlColors>? other, double t) {
    if (other is! UntravelledSegmentedControlColors) return this;

    return UntravelledSegmentedControlColors(
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      selectedSegmentColor: colorPremulLerp(selectedSegmentColor, other.selectedSegmentColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      selectedTextColor: colorPremulLerp(selectedTextColor, other.selectedTextColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSegmentedControlColors"))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("selectedSegmentColor", selectedSegmentColor))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("selectedTextColor", selectedTextColor));
  }
}
