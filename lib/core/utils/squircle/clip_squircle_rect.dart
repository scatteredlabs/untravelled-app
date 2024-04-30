import 'package:flutter/widgets.dart';

import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border_radius.dart';

class UntravelledClipSquircleRect extends StatelessWidget {
  final UntravelledSquircleBorderRadius radius;
  final Clip clipBehavior;
  final Widget? child;

  const UntravelledClipSquircleRect({
    super.key,
    required this.child,
    this.radius = UntravelledSquircleBorderRadius.zero,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath.shape(
      clipBehavior: clipBehavior,
      shape: UntravelledSquircleBorder(
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
