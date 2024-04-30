import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/utils/color_premul_lerp.dart';

@immutable
class UntravelledHoverEffects extends ThemeExtension<UntravelledHoverEffects> with DiagnosticableTreeMixin {
  /// Primary hover effect color.
  final Color primaryHoverColor;

  /// Secondary hover effect color.
  final Color secondaryHoverColor;

  /// Hover effect duration.
  final Duration hoverDuration;

  /// Hover effect curve.
  final Curve hoverCurve;

  const UntravelledHoverEffects({
    required this.primaryHoverColor,
    required this.secondaryHoverColor,
    required this.hoverDuration,
    required this.hoverCurve,
  });

  @override
  UntravelledHoverEffects copyWith({
    Color? primaryHoverColor,
    Color? secondaryHoverColor,
    Duration? hoverDuration,
    Curve? hoverCurve,
  }) {
    return UntravelledHoverEffects(
      primaryHoverColor: primaryHoverColor ?? this.primaryHoverColor,
      secondaryHoverColor: secondaryHoverColor ?? this.secondaryHoverColor,
      hoverDuration: hoverDuration ?? this.hoverDuration,
      hoverCurve: hoverCurve ?? this.hoverCurve,
    );
  }

  @override
  UntravelledHoverEffects lerp(ThemeExtension<UntravelledHoverEffects>? other, double t) {
    if (other is! UntravelledHoverEffects) return this;

    return UntravelledHoverEffects(
      primaryHoverColor: colorPremulLerp(primaryHoverColor, other.primaryHoverColor, t)!,
      secondaryHoverColor: colorPremulLerp(secondaryHoverColor, other.secondaryHoverColor, t)!,
      hoverDuration: lerpDuration(hoverDuration, other.hoverDuration, t),
      hoverCurve: other.hoverCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledHoverEffects"))
      ..add(ColorProperty("primaryHoverColor", primaryHoverColor))
      ..add(ColorProperty("secondaryHoverColor", secondaryHoverColor))
      ..add(DiagnosticsProperty<Duration>("hoverDuration", hoverDuration))
      ..add(DiagnosticsProperty<Curve>("hoverCurve", hoverCurve));
  }
}
