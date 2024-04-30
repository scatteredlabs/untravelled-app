import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledAccordionProperties extends ThemeExtension<UntravelledAccordionProperties> with DiagnosticableTreeMixin {
  /// Accordion transition duration.
  final Duration transitionDuration;

  /// Accordion transition curve.
  final Curve transitionCurve;

  const UntravelledAccordionProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  UntravelledAccordionProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return UntravelledAccordionProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  UntravelledAccordionProperties lerp(ThemeExtension<UntravelledAccordionProperties>? other, double t) {
    if (other is! UntravelledAccordionProperties) return this;

    return UntravelledAccordionProperties(
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAccordionProperties"))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve));
  }
}
