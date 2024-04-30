import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledAccordionShadows extends ThemeExtension<UntravelledAccordionShadows> with DiagnosticableTreeMixin {
  /// Accordion shadows.
  final List<BoxShadow> shadows;

  const UntravelledAccordionShadows({
    required this.shadows,
  });

  @override
  UntravelledAccordionShadows copyWith({List<BoxShadow>? shadows}) {
    return UntravelledAccordionShadows(
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  UntravelledAccordionShadows lerp(ThemeExtension<UntravelledAccordionShadows>? other, double t) {
    if (other is! UntravelledAccordionShadows) return this;

    return UntravelledAccordionShadows(
      shadows: BoxShadow.lerpList(shadows, other.shadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledAccordionShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("shadows", shadows));
  }
}
