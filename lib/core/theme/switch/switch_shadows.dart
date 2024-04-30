import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledSwitchShadows extends ThemeExtension<UntravelledSwitchShadows> with DiagnosticableTreeMixin {
  /// Switch thumb shadows.
  final List<BoxShadow> thumbShadows;

  const UntravelledSwitchShadows({
    required this.thumbShadows,
  });

  @override
  UntravelledSwitchShadows copyWith({List<BoxShadow>? thumbShadows}) {
    return UntravelledSwitchShadows(
      thumbShadows: thumbShadows ?? this.thumbShadows,
    );
  }

  @override
  UntravelledSwitchShadows lerp(ThemeExtension<UntravelledSwitchShadows>? other, double t) {
    if (other is! UntravelledSwitchShadows) return this;

    return UntravelledSwitchShadows(
      thumbShadows: BoxShadow.lerpList(thumbShadows, other.thumbShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledSwitchShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("thumbShadows", thumbShadows));
  }
}
