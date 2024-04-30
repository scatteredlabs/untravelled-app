import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untravelled_app/core/untravelled_design.dart';

import 'package:untravelled_app/core/theme/effects/controls_effects.dart';
import 'package:untravelled_app/core/theme/effects/focus_effects.dart';
import 'package:untravelled_app/core/theme/effects/hover_effects.dart';

@immutable
class UntravelledEffectsTheme extends ThemeExtension<UntravelledEffectsTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// Control widgets focus effect.
  final UntravelledFocusEffects controlFocusEffect;

  /// Control widgets hover effect.
  final UntravelledHoverEffects controlHoverEffect;

  /// Control widgets focus effect.
  final UntravelledControlsEffects controlPulseEffect;

  /// Control widgets scale effect.
  final UntravelledControlsEffects controlScaleEffect;

  UntravelledEffectsTheme({
    required this.tokens,
    UntravelledFocusEffects? controlFocusEffect,
    UntravelledHoverEffects? controlHoverEffect,
    UntravelledControlsEffects? controlPulseEffect,
    UntravelledControlsEffects? controlScaleEffect,
  })  : controlFocusEffect = controlFocusEffect ??
            UntravelledFocusEffects(
              effectColor: tokens.colors.bulma.withOpacity(0.25),
              effectExtent: 4,
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlHoverEffect = controlHoverEffect ??
            UntravelledHoverEffects(
              primaryHoverColor: tokens.colors.heles,
              secondaryHoverColor: tokens.colors.jiren,
              hoverDuration: tokens.transitions.defaultTransitionDuration,
              hoverCurve: tokens.transitions.defaultTransitionCurve,
            ),
        controlPulseEffect = controlPulseEffect ??
            UntravelledControlsEffects(
              effectColor: tokens.colors.piccolo,
              effectDuration: const Duration(milliseconds: 1400),
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectExtent: 24,
            ),
        controlScaleEffect = controlScaleEffect ??
            UntravelledControlsEffects(
              effectDuration: tokens.transitions.defaultTransitionDuration,
              effectCurve: tokens.transitions.defaultTransitionCurve,
              effectScalar: 0.95,
            );

  @override
  UntravelledEffectsTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledFocusEffects? controlFocusEffect,
    UntravelledHoverEffects? controlHoverEffect,
    UntravelledControlsEffects? controlPulseEffect,
    UntravelledControlsEffects? controlScaleEffect,
  }) {
    return UntravelledEffectsTheme(
      tokens: tokens ?? this.tokens,
      controlFocusEffect: controlFocusEffect ?? this.controlFocusEffect,
      controlHoverEffect: controlHoverEffect ?? this.controlHoverEffect,
      controlPulseEffect: controlPulseEffect ?? this.controlPulseEffect,
      controlScaleEffect: controlScaleEffect ?? this.controlScaleEffect,
    );
  }

  @override
  UntravelledEffectsTheme lerp(ThemeExtension<UntravelledEffectsTheme>? other, double t) {
    if (other is! UntravelledEffectsTheme) return this;

    return UntravelledEffectsTheme(
      tokens: tokens.lerp(other.tokens, t),
      controlFocusEffect: controlFocusEffect.lerp(other.controlFocusEffect, t),
      controlHoverEffect: controlHoverEffect.lerp(other.controlHoverEffect, t),
      controlScaleEffect: controlScaleEffect.lerp(other.controlScaleEffect, t),
      controlPulseEffect: controlPulseEffect.lerp(other.controlPulseEffect, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledEffectsTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledControlsEffects>("controlScaleEffect", controlScaleEffect))
      ..add(DiagnosticsProperty<UntravelledControlsEffects>("controlPulseEffect", controlPulseEffect))
      ..add(DiagnosticsProperty<UntravelledFocusEffects>("controlFocusEffect", controlFocusEffect))
      ..add(DiagnosticsProperty<UntravelledHoverEffects>("controlHoverEffect", controlHoverEffect));
  }
}
