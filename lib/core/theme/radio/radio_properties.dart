import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UntravelledRadioProperties extends ThemeExtension<UntravelledRadioProperties> with DiagnosticableTreeMixin {
  /// Radio text style.
  final TextStyle textStyle;

  const UntravelledRadioProperties({
    required this.textStyle,
  });

  @override
  UntravelledRadioProperties copyWith({
    TextStyle? textStyle,
  }) {
    return UntravelledRadioProperties(
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  UntravelledRadioProperties lerp(ThemeExtension<UntravelledRadioProperties>? other, double t) {
    if (other is! UntravelledRadioProperties) return this;

    return UntravelledRadioProperties(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledRadioProperties"))
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle));
  }
}
