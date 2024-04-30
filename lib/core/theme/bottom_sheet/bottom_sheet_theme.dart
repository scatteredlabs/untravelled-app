import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/bottom_sheet/bottom_sheet_colors.dart';
import 'package:untravelled_app/core/theme/bottom_sheet/bottom_sheet_properties.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledBottomSheetTheme extends ThemeExtension<UntravelledBottomSheetTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// BottomSheet colors.
  final UntravelledBottomSheetColors colors;

  /// BottomSheet properties.
  final UntravelledBottomSheetProperties properties;

  UntravelledBottomSheetTheme({
    required this.tokens,
    UntravelledBottomSheetColors? colors,
    UntravelledBottomSheetProperties? properties,
  })  : colors = colors ??
            UntravelledBottomSheetColors(
              textColor: tokens.colors.textPrimary,
              iconColor: tokens.colors.iconPrimary,
              backgroundColor: tokens.colors.gohan,
              barrierColor: tokens.colors.zeno,
            ),
        properties = properties ??
            UntravelledBottomSheetProperties(
              borderRadius: tokens.borders.surfaceLg,
              transitionDuration: const Duration(milliseconds: 350),
              transitionCurve: const Cubic(0.0, 0.0, 0.2, 1.0),
              textStyle: tokens.typography.body.textDefault,
            );

  @override
  UntravelledBottomSheetTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledBottomSheetColors? colors,
    UntravelledBottomSheetProperties? properties,
  }) {
    return UntravelledBottomSheetTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
    );
  }

  @override
  UntravelledBottomSheetTheme lerp(ThemeExtension<UntravelledBottomSheetTheme>? other, double t) {
    if (other is! UntravelledBottomSheetTheme) return this;

    return UntravelledBottomSheetTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledBottomSheetTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledBottomSheetColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledBottomSheetProperties>("properties", properties));
  }
}
