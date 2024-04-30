import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledBottomSheetColors extends ThemeExtension<UntravelledBottomSheetColors> with DiagnosticableTreeMixin {
  /// BottomSheet text color.
  final Color textColor;

  /// BottomSheet icon color.
  final Color iconColor;

  /// BottomSheet background color.
  final Color backgroundColor;

  /// BottomSheet barrier color.
  final Color barrierColor;

  const UntravelledBottomSheetColors({
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.barrierColor,
  });

  @override
  UntravelledBottomSheetColors copyWith({
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return UntravelledBottomSheetColors(
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
    );
  }

  @override
  UntravelledBottomSheetColors lerp(ThemeExtension<UntravelledBottomSheetColors>? other, double t) {
    if (other is! UntravelledBottomSheetColors) return this;

    return UntravelledBottomSheetColors(
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
      iconColor: colorPremulLerp(iconColor, other.iconColor, t)!,
      backgroundColor: colorPremulLerp(backgroundColor, other.backgroundColor, t)!,
      barrierColor: colorPremulLerp(barrierColor, other.barrierColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledBottomSheetColors"))
      ..add(ColorProperty("textColor", textColor))
      ..add(ColorProperty("iconColor", iconColor))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(ColorProperty("barrierColor", barrierColor));
  }
}
