import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledSwitchProperties extends ThemeExtension<UntravelledSwitchProperties> with DiagnosticableTreeMixin {
  /// Switch transition duration.
  final Duration transitionDuration;

  /// Switch transition curve.
  final Curve transitionCurve;

  const UntravelledSwitchProperties({
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  UntravelledSwitchProperties copyWith({
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return UntravelledSwitchProperties(
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  UntravelledSwitchProperties lerp(ThemeExtension<UntravelledSwitchProperties>? other, double t) {
    if (other is! UntravelledSwitchProperties) return this;

    return UntravelledSwitchProperties(
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSwitchProperties"))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve));
  }
}
