import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTooltipShadows extends ThemeExtension<UntravelledTooltipShadows> with DiagnosticableTreeMixin {
  /// Tooltip shadows.
  final List<BoxShadow> tooltipShadows;

  const UntravelledTooltipShadows({
    required this.tooltipShadows,
  });

  @override
  UntravelledTooltipShadows copyWith({List<BoxShadow>? tooltipShadows}) {
    return UntravelledTooltipShadows(
      tooltipShadows: tooltipShadows ?? this.tooltipShadows,
    );
  }

  @override
  UntravelledTooltipShadows lerp(ThemeExtension<UntravelledTooltipShadows>? other, double t) {
    if (other is! UntravelledTooltipShadows) return this;

    return UntravelledTooltipShadows(
      tooltipShadows: BoxShadow.lerpList(tooltipShadows, other.tooltipShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTooltipShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("tooltipShadows", tooltipShadows));
  }
}
