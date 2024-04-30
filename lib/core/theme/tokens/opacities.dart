import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledOpacities extends ThemeExtension<UntravelledOpacities> with DiagnosticableTreeMixin {
  static const opacities = UntravelledOpacities(disabled: 0.6);

  /// Disabled opacity value.
  final double disabled;

  const UntravelledOpacities({
    required this.disabled,
  });

  @override
  UntravelledOpacities copyWith({
    double? disabled,
  }) {
    return UntravelledOpacities(
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  UntravelledOpacities lerp(ThemeExtension<UntravelledOpacities>? other, double t) {
    if (other is! UntravelledOpacities) return this;

    return UntravelledOpacities(
      disabled: lerpDouble(disabled, other.disabled, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledOpacities"))
      ..add(DoubleProperty("disabled", disabled));
  }
}
