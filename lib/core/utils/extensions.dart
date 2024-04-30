import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:untravelled_app/core/utils/squircle/squircle_border_radius.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_radius.dart';

extension BuildContextX on BuildContext {
  /// Is dark mode currently active.
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

extension BorderRadiusGeometryX on BorderRadiusGeometry {
  /// Returns UntravelledSquircleBorderRadius.
  UntravelledSquircleBorderRadius squircleBorderRadius(BuildContext context) {
    final borderRadius = resolve(Directionality.of(context));

    return UntravelledSquircleBorderRadius.only(
      topLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.topLeft.x),
      topRight: UntravelledSquircleRadius(cornerRadius: borderRadius.topRight.x),
      bottomLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
      bottomRight: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
    );
  }
}
