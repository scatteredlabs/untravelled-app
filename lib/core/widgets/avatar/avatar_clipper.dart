import 'package:flutter/rendering.dart';

import 'package:untravelled_app/core/utils/squircle/squircle_radius.dart';
import 'package:untravelled_app/core/widgets/avatar/avatar.dart';

class AvatarClipper extends CustomClipper<Path> {
  final bool showBadge;
  final BorderRadius borderRadius;
  final double height;
  final double width;
  final double badgeMarginValue;
  final double badgeSize;
  final UntravelledBadgeAlignment badgeAlignment;
  final TextDirection textDirection;

  AvatarClipper({
    required this.showBadge,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.badgeMarginValue,
    required this.badgeSize,
    required this.badgeAlignment,
    required this.textDirection,
  });

  Path _getBadgePath() {
    final double badgeRadius = badgeSize / 2;

    if (textDirection == TextDirection.rtl) {
      switch (badgeAlignment) {
        case UntravelledBadgeAlignment.topLeft:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, 0 + badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.topRight:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(0 + badgeRadius, 0 + badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.bottomLeft:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, width - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.bottomRight:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(0 + badgeRadius, width - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        default:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, width - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
      }
    } else {
      switch (badgeAlignment) {
        case UntravelledBadgeAlignment.topLeft:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(0 + badgeRadius, 0 + badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.topRight:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, 0 + badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.bottomLeft:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(0 + badgeRadius, height - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        case UntravelledBadgeAlignment.bottomRight:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, height - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
        default:
          return Path()
            ..addOval(
              Rect.fromCircle(
                center: Offset(width - badgeRadius, width - badgeRadius),
                radius: badgeRadius + badgeMarginValue,
              ),
            );
      }
    }
  }

  @override
  Path getClip(Size size) {
    final Path pathWithBadge = Path.combine(
      PathOperation.difference,
      // Avatar shape properties
      Path()
        ..addRRect(
          RRect.fromLTRBAndCorners(
            0,
            0,
            width,
            height,
            topLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.topLeft.x),
            topRight: UntravelledSquircleRadius(cornerRadius: borderRadius.topRight.x),
            bottomLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
            bottomRight: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
          ),
        ),
      // Badge shape properties
      _getBadgePath(),
    );

    final Path pathWithoutBadge = Path()
      ..addRRect(
        RRect.fromLTRBAndCorners(
          0,
          0,
          width,
          height,
          topLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.topLeft.x),
          topRight: UntravelledSquircleRadius(cornerRadius: borderRadius.topRight.x),
          bottomLeft: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
          bottomRight: UntravelledSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
        ),
      );

    return showBadge ? pathWithBadge : pathWithoutBadge;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
