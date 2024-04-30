import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledSwitchColors extends ThemeExtension<UntravelledSwitchColors> with DiagnosticableTreeMixin {
  /// Switch active track color.
  final Color activeTrackColor;

  /// Switch inactive track color.
  final Color inactiveTrackColor;

  /// Switch active track text color.
  final Color activeTextColor;

  /// Switch inactive track text color.
  final Color inactiveTextColor;

  /// Switch active track icon color.
  final Color activeIconColor;

  /// Switch inactive track icon color.
  final Color inactiveIconColor;

  /// Switch icon Color.
  final Color thumbIconColor;

  /// Switch thumb color.
  final Color thumbColor;

  const UntravelledSwitchColors({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.thumbIconColor,
    required this.thumbColor,
  });

  @override
  UntravelledSwitchColors copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeTextColor,
    Color? inactiveTextColor,
    Color? activeIconColor,
    Color? inactiveIconColor,
    Color? thumbIconColor,
    Color? thumbColor,
  }) {
    return UntravelledSwitchColors(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeTextColor: activeTextColor ?? this.activeTextColor,
      inactiveTextColor: inactiveTextColor ?? this.inactiveTextColor,
      activeIconColor: activeIconColor ?? this.activeIconColor,
      inactiveIconColor: inactiveIconColor ?? this.inactiveIconColor,
      thumbIconColor: thumbIconColor ?? this.thumbIconColor,
      thumbColor: thumbColor ?? this.thumbColor,
    );
  }

  @override
  UntravelledSwitchColors lerp(ThemeExtension<UntravelledSwitchColors>? other, double t) {
    if (other is! UntravelledSwitchColors) return this;

    return UntravelledSwitchColors(
      activeTrackColor: colorPremulLerp(activeTrackColor, other.activeTrackColor, t)!,
      inactiveTrackColor: colorPremulLerp(inactiveTrackColor, other.inactiveTrackColor, t)!,
      activeTextColor: colorPremulLerp(activeTextColor, other.activeTextColor, t)!,
      inactiveTextColor: colorPremulLerp(inactiveTextColor, other.inactiveTextColor, t)!,
      activeIconColor: colorPremulLerp(activeIconColor, other.activeIconColor, t)!,
      inactiveIconColor: colorPremulLerp(inactiveIconColor, other.inactiveIconColor, t)!,
      thumbIconColor: colorPremulLerp(thumbIconColor, other.thumbIconColor, t)!,
      thumbColor: colorPremulLerp(thumbColor, other.thumbColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSwitchColors"))
      ..add(ColorProperty("activeTrackColor", activeTrackColor))
      ..add(ColorProperty("inactiveTrackColor", inactiveTrackColor))
      ..add(ColorProperty("activeTextColor", activeTextColor))
      ..add(ColorProperty("inactiveTextColor", inactiveTextColor))
      ..add(ColorProperty("activeIconColor", activeIconColor))
      ..add(ColorProperty("inactiveIconColor", inactiveIconColor))
      ..add(ColorProperty("thumbIconColor", thumbIconColor))
      ..add(ColorProperty("thumbColor", thumbColor));
  }
}
