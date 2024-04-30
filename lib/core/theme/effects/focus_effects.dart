import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledFocusEffects extends ThemeExtension<UntravelledFocusEffects> with DiagnosticableTreeMixin {
  /// Focus effect color.
  final Color effectColor;

  /// Focus effect extent.
  final double effectExtent;

  /// Focus effect duration.
  final Duration effectDuration;

  /// Focus effect curve.
  final Curve effectCurve;

  const UntravelledFocusEffects({
    required this.effectColor,
    required this.effectExtent,
    required this.effectDuration,
    required this.effectCurve,
  });

  @override
  UntravelledFocusEffects copyWith({
    Color? effectColor,
    double? effectExtent,
    Duration? effectDuration,
    Curve? effectCurve,
  }) {
    return UntravelledFocusEffects(
      effectColor: effectColor ?? this.effectColor,
      effectExtent: effectExtent ?? this.effectExtent,
      effectDuration: effectDuration ?? this.effectDuration,
      effectCurve: effectCurve ?? this.effectCurve,
    );
  }

  @override
  UntravelledFocusEffects lerp(ThemeExtension<UntravelledFocusEffects>? other, double t) {
    if (other is! UntravelledFocusEffects) return this;

    return UntravelledFocusEffects(
      effectColor: colorPremulLerp(effectColor, other.effectColor, t)!,
      effectExtent: lerpDouble(effectExtent, other.effectExtent, t)!,
      effectDuration: lerpDuration(effectDuration, other.effectDuration, t),
      effectCurve: other.effectCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledFocusEffects"))
      ..add(ColorProperty("effectColor", effectColor))
      ..add(DoubleProperty("effectExtent", effectExtent))
      ..add(DiagnosticsProperty<Duration>("effectDuration", effectDuration))
      ..add(DiagnosticsProperty<Curve>("effectCurve", effectCurve));
  }
}
