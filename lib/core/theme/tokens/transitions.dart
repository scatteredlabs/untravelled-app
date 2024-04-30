import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledTransitions extends ThemeExtension<UntravelledTransitions> with DiagnosticableTreeMixin {
  static const transitions = UntravelledTransitions(
    defaultTransitionDuration: Duration(milliseconds: 200),
    defaultTransitionCurve: Curves.easeInOutCubic,
  );

  /// Default transition duration.
  final Duration defaultTransitionDuration;

  /// Default transition curve.
  final Curve defaultTransitionCurve;

  const UntravelledTransitions({
    required this.defaultTransitionDuration,
    required this.defaultTransitionCurve,
  });

  @override
  UntravelledTransitions copyWith({
    Duration? defaultTransitionDuration,
    Curve? defaultTransitionCurve,
  }) {
    return UntravelledTransitions(
      defaultTransitionDuration: defaultTransitionDuration ?? this.defaultTransitionDuration,
      defaultTransitionCurve: defaultTransitionCurve ?? this.defaultTransitionCurve,
    );
  }

  @override
  UntravelledTransitions lerp(ThemeExtension<UntravelledTransitions>? other, double t) {
    if (other is! UntravelledTransitions) return this;

    return UntravelledTransitions(
      defaultTransitionDuration: lerpDuration(defaultTransitionDuration, other.defaultTransitionDuration, t),
      defaultTransitionCurve: other.defaultTransitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTransitions"))
      ..add(DiagnosticsProperty<Duration>("defaultTransitionDuration", defaultTransitionDuration))
      ..add(DiagnosticsProperty<Curve>("defaultTransitionCurve", defaultTransitionCurve));
  }
}
