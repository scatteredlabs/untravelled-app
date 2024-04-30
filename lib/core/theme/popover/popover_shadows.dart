import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledPopoverShadows extends ThemeExtension<UntravelledPopoverShadows> with DiagnosticableTreeMixin {
  /// Popover shadows.
  final List<BoxShadow> popoverShadows;

  const UntravelledPopoverShadows({
    required this.popoverShadows,
  });

  @override
  UntravelledPopoverShadows copyWith({List<BoxShadow>? popoverShadows}) {
    return UntravelledPopoverShadows(
      popoverShadows: popoverShadows ?? this.popoverShadows,
    );
  }

  @override
  UntravelledPopoverShadows lerp(ThemeExtension<UntravelledPopoverShadows>? other, double t) {
    if (other is! UntravelledPopoverShadows) return this;

    return UntravelledPopoverShadows(
      popoverShadows: BoxShadow.lerpList(popoverShadows, other.popoverShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledPopoverShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("popoverShadows", popoverShadows));
  }
}
