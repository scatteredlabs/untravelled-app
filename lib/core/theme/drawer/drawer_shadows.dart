import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledDrawerShadows extends ThemeExtension<UntravelledDrawerShadows> with DiagnosticableTreeMixin {
  /// Drawer shadows.
  final List<BoxShadow> drawerShadows;

  const UntravelledDrawerShadows({
    required this.drawerShadows,
  });

  @override
  UntravelledDrawerShadows copyWith({List<BoxShadow>? drawerShadows}) {
    return UntravelledDrawerShadows(
      drawerShadows: drawerShadows ?? this.drawerShadows,
    );
  }

  @override
  UntravelledDrawerShadows lerp(ThemeExtension<UntravelledDrawerShadows>? other, double t) {
    if (other is! UntravelledDrawerShadows) return this;

    return UntravelledDrawerShadows(
      drawerShadows: BoxShadow.lerpList(drawerShadows, other.drawerShadows, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledDrawerShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("drawerShadows", drawerShadows));
  }
}
