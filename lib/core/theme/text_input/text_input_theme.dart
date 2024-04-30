import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/text_input/text_input_colors.dart';
import 'package:untravelled_app/core/theme/text_input/text_input_properties.dart';
import 'package:untravelled_app/core/theme/text_input/text_input_sizes.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';

@immutable
class UntravelledTextInputTheme extends ThemeExtension<UntravelledTextInputTheme> with DiagnosticableTreeMixin {
  /// MDS tokens.
  final UntravelledTokens tokens;

  /// TextInput colors.
  final UntravelledTextInputColors colors;

  /// TextInput properties.
  final UntravelledTextInputProperties properties;

  /// TextInput sizes.
  final UntravelledTextInputSizes sizes;

  UntravelledTextInputTheme({
    required this.tokens,
    UntravelledTextInputColors? colors,
    UntravelledTextInputProperties? properties,
    UntravelledTextInputSizes? sizes,
  })  : colors = colors ??
            UntravelledTextInputColors(
              backgroundColor: tokens.colors.gohan,
              activeBorderColor: tokens.colors.piccolo,
              inactiveBorderColor: tokens.colors.beerus,
              errorColor: tokens.colors.chiChi100,
              hoverBorderColor: tokens.colors.beerus,
              textColor: tokens.colors.trunks,
              helperTextColor: tokens.colors.trunks,
            ),
        properties = properties ??
            UntravelledTextInputProperties(
              // The duration value extracted from:
              // https://github.com/material-components/material-components-android/blob/master/lib/java/com/google/android/material/textfield/TextInputLayout.java
              transitionDuration: const Duration(milliseconds: 167),
              transitionCurve: Curves.fastOutSlowIn,
              helperPadding: EdgeInsets.only(top: tokens.sizes.x4s),
              helperTextStyle: tokens.typography.body.text12,
            ),
        sizes = sizes ?? UntravelledTextInputSizes(tokens: tokens);

  @override
  UntravelledTextInputTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledTextInputColors? colors,
    UntravelledTextInputProperties? properties,
    UntravelledTextInputSizes? sizes,
  }) {
    return UntravelledTextInputTheme(
      tokens: tokens ?? this.tokens,
      colors: colors ?? this.colors,
      properties: properties ?? this.properties,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  UntravelledTextInputTheme lerp(ThemeExtension<UntravelledTextInputTheme>? other, double t) {
    if (other is! UntravelledTextInputTheme) return this;

    return UntravelledTextInputTheme(
      tokens: tokens.lerp(other.tokens, t),
      colors: colors.lerp(other.colors, t),
      properties: properties.lerp(other.properties, t),
      sizes: sizes.lerp(other.sizes, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder diagnosticProperties) {
    super.debugFillProperties(diagnosticProperties);
    diagnosticProperties
      ..add(DiagnosticsProperty("type", "UntravelledTextInputTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("tokens", tokens))
      ..add(DiagnosticsProperty<UntravelledTextInputColors>("colors", colors))
      ..add(DiagnosticsProperty<UntravelledTextInputProperties>("properties", properties))
      ..add(DiagnosticsProperty<UntravelledTextInputSizes>("sizes", sizes));
  }
}
