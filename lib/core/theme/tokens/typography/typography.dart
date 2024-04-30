import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tokens/typography/text_styles.dart';

@immutable
class UntravelledTypography extends ThemeExtension<UntravelledTypography> with DiagnosticableTreeMixin {
  static const typography = UntravelledTypography(
    body: UntravelledTextStyles.body,
    caption: UntravelledTextStyles.caption,
    heading: UntravelledTextStyles.heading,
  );

  /// Styles for body text.
  final UntravelledTextStyles body;

  /// Styles for caption text.
  final UntravelledTextStyles caption;

  /// Styles for headings.
  final UntravelledTextStyles heading;

  const UntravelledTypography({
    required this.body,
    required this.caption,
    required this.heading,
  });

  @override
  UntravelledTypography copyWith({
    UntravelledTextStyles? body,
    UntravelledTextStyles? caption,
    UntravelledTextStyles? heading,
  }) {
    return UntravelledTypography(
      body: body ?? this.body,
      caption: caption ?? this.caption,
      heading: heading ?? this.heading,
    );
  }

  @override
  UntravelledTypography lerp(ThemeExtension<UntravelledTypography>? other, double t) {
    if (other is! UntravelledTypography) return this;

    return UntravelledTypography(
      body: body.lerp(other.body, t),
      caption: caption.lerp(other.caption, t),
      heading: heading.lerp(other.heading, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTypography"))
      ..add(DiagnosticsProperty("body", body))
      ..add(DiagnosticsProperty("caption", caption))
      ..add(DiagnosticsProperty("heading", heading));
  }
}
