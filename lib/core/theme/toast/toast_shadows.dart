import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledToastShadows extends ThemeExtension<UntravelledToastShadows> with DiagnosticableTreeMixin {
  /// Toast shadows.
  final List<BoxShadow> toastShadows;

  const UntravelledToastShadows({
    required this.toastShadows,
  });

  @override
  UntravelledToastShadows copyWith({List<BoxShadow>? toastShadows}) {
    return UntravelledToastShadows(
      toastShadows: toastShadows ?? this.toastShadows,
    );
  }

  @override
  UntravelledToastShadows lerp(ThemeExtension<UntravelledToastShadows>? other, double t) {
    if (other is! UntravelledToastShadows) return this;

    return UntravelledToastShadows(
      toastShadows: BoxShadow.lerpList(toastShadows, other.toastShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledToastShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("toastShadows", toastShadows));
  }
}
