import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledShadows extends ThemeExtension<UntravelledShadows> with DiagnosticableTreeMixin {
  static const light = UntravelledShadows(
    sm: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 6,
        offset: Offset(0, 6),
        spreadRadius: -6,
      ),
    ],
    md: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 12,
        offset: Offset(0, 12),
      ),
    ],
    lg: [
      BoxShadow(
        color: Color(0x66000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x28000000),
        blurRadius: 24,
        offset: Offset(0, 8),
      ),
    ],
    xl: [
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0x1E000000),
        blurRadius: 32,
      ),
      BoxShadow(
        color: Color(0x14000000),
        blurRadius: 32,
        offset: Offset(0, 32),
      ),
    ],
  );

  static const dark = UntravelledShadows(
    sm: [
      BoxShadow(
        color: Color(0x8E000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0xA3000000),
        blurRadius: 6,
        offset: Offset(0, 6),
        spreadRadius: -6,
      ),
    ],
    md: [
      BoxShadow(
        color: Color(0x8E000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0xA3000000),
        blurRadius: 12,
        offset: Offset(0, 12),
      ),
    ],
    lg: [
      BoxShadow(
        color: Color(0x8E000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0xA3000000),
        blurRadius: 24,
        offset: Offset(0, 24),
      ),
    ],
    xl: [
      BoxShadow(
        color: Color(0xB7000000),
        blurRadius: 1,
      ),
      BoxShadow(
        color: Color(0xE0000000),
        blurRadius: 48,
        offset: Offset(0, 48),
      ),
    ],
  );

  /// Small shadow.
  final List<BoxShadow> sm;

  /// Medium shadow.
  final List<BoxShadow> md;

  /// Large shadow.
  final List<BoxShadow> lg;

  /// Extra large shadow.
  final List<BoxShadow> xl;

  const UntravelledShadows({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  @override
  UntravelledShadows copyWith({
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
    List<BoxShadow>? xl,
  }) {
    return UntravelledShadows(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
    );
  }

  @override
  UntravelledShadows lerp(ThemeExtension<UntravelledShadows>? other, double t) {
    if (other is! UntravelledShadows) return this;

    return UntravelledShadows(
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
      lg: BoxShadow.lerpList(lg, other.lg, t)!,
      xl: BoxShadow.lerpList(xl, other.xl, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledShadows"))
      ..add(DiagnosticsProperty<List<BoxShadow>>("sm", sm))
      ..add(DiagnosticsProperty<List<BoxShadow>>("md", md))
      ..add(DiagnosticsProperty<List<BoxShadow>>("lg", lg))
      ..add(DiagnosticsProperty<List<BoxShadow>>("xl", xl));
  }
}
