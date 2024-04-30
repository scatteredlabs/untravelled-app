import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledCarouselProperties extends ThemeExtension<UntravelledCarouselProperties> with DiagnosticableTreeMixin {
  /// Gap between Carousel items.
  final double gap;

  /// Carousel item text style.
  final TextStyle textStyle;

  /// Carousel auto play delay between items.
  final Duration autoPlayDelay;

  /// Carousel transition duration.
  final Duration transitionDuration;

  /// Carousel transition curve.
  final Curve transitionCurve;

  const UntravelledCarouselProperties({
    required this.gap,
    required this.textStyle,
    required this.autoPlayDelay,
    required this.transitionDuration,
    required this.transitionCurve,
  });

  @override
  UntravelledCarouselProperties copyWith({
    double? gap,
    TextStyle? textStyle,
    Duration? autoPlayDelay,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return UntravelledCarouselProperties(
      gap: gap ?? this.gap,
      textStyle: textStyle ?? this.textStyle,
      autoPlayDelay: autoPlayDelay ?? this.autoPlayDelay,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  UntravelledCarouselProperties lerp(ThemeExtension<UntravelledCarouselProperties>? other, double t) {
    if (other is! UntravelledCarouselProperties) return this;

    return UntravelledCarouselProperties(
      gap: lerpDouble(gap, other.gap, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      autoPlayDelay: lerpDuration(autoPlayDelay, other.autoPlayDelay, t),
      transitionDuration: lerpDuration(transitionDuration, other.transitionDuration, t),
      transitionCurve: other.transitionCurve,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledCarouselProperties"))
      ..add(DoubleProperty("gap", gap))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle))
      ..add(DiagnosticsProperty<Duration>("autoPlayDelay", autoPlayDelay))
      ..add(DiagnosticsProperty<Duration>("transitionDuration", transitionDuration))
      ..add(DiagnosticsProperty<Curve>("transitionCurve", transitionCurve));
  }
}
