import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/avatar/avatar_size_properties.dart';
import 'package:untravelled_app/core/theme/avatar/avatar_sizes.dart';
import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/tokens.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';
import 'package:untravelled_app/core/widgets/avatar/avatar_clipper.dart';

enum UntravelledAvatarSize {
  xs,
  sm,
  md,
  lg,
  xl,
  x2l,
}

enum UntravelledBadgeAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class UntravelledAvatar extends StatelessWidget {
  /// Whether to show the avatar badge or not.
  final bool showBadge;

  /// The border radius of the avatar.
  final BorderRadiusGeometry? borderRadius;

  /// The background color of the avatar.
  final Color? backgroundColor;

  /// The color of the avatar badge.
  final Color? badgeColor;

  /// The margin value of the avatars badge.
  final double? badgeMarginValue;

  /// The size of the avatars badge.
  final double? badgeSize;

  /// The width of the avatar.
  final double? height;

  /// The height of the avatar.
  final double? width;

  /// The background image of the avatar.
  final ImageProvider<Object>? backgroundImage;

  /// The size of the avatar.
  final UntravelledAvatarSize? avatarSize;

  /// The alignment of the avatar badge.
  final UntravelledBadgeAlignment badgeAlignment;

  /// The semantic label for the avatar.
  final String? semanticLabel;

  /// The content of the avatar.
  final Widget? content;

  /// MDS avatar widget.
  const UntravelledAvatar({
    super.key,
    this.showBadge = false,
    this.borderRadius,
    this.backgroundColor,
    this.badgeColor,
    this.badgeMarginValue,
    this.badgeSize,
    this.height,
    this.width,
    this.backgroundImage,
    this.avatarSize,
    this.badgeAlignment = UntravelledBadgeAlignment.bottomRight,
    this.semanticLabel,
    this.content,
  });

  Alignment _avatarAlignmentMapper(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    if (isRTL) {
      switch (badgeAlignment) {
        case UntravelledBadgeAlignment.topLeft:
          return Alignment.topRight;
        case UntravelledBadgeAlignment.topRight:
          return Alignment.topLeft;
        case UntravelledBadgeAlignment.bottomLeft:
          return Alignment.bottomRight;
        case UntravelledBadgeAlignment.bottomRight:
          return Alignment.bottomLeft;
        default:
          return Alignment.bottomRight;
      }
    } else {
      switch (badgeAlignment) {
        case UntravelledBadgeAlignment.topLeft:
          return Alignment.topLeft;
        case UntravelledBadgeAlignment.topRight:
          return Alignment.topRight;
        case UntravelledBadgeAlignment.bottomLeft:
          return Alignment.bottomLeft;
        case UntravelledBadgeAlignment.bottomRight:
          return Alignment.bottomRight;
        default:
          return Alignment.bottomRight;
      }
    }
  }

  UntravelledAvatarSizeProperties _getUntravelledAvatarSize(BuildContext context, UntravelledAvatarSize? untravelledAvatarSize) {
    switch (untravelledAvatarSize) {
      case UntravelledAvatarSize.xs:
        return context.untravelledTheme?.avatarTheme.sizes.xs ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).xs;
      case UntravelledAvatarSize.sm:
        return context.untravelledTheme?.avatarTheme.sizes.sm ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).sm;
      case UntravelledAvatarSize.md:
        return context.untravelledTheme?.avatarTheme.sizes.md ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).md;
      case UntravelledAvatarSize.lg:
        return context.untravelledTheme?.avatarTheme.sizes.lg ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).lg;
      case UntravelledAvatarSize.xl:
        return context.untravelledTheme?.avatarTheme.sizes.xl ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).xl;
      case UntravelledAvatarSize.x2l:
        return context.untravelledTheme?.avatarTheme.sizes.x2l ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).x2l;
      default:
        return context.untravelledTheme?.avatarTheme.sizes.md ?? UntravelledAvatarSizes(tokens: UntravelledTokens.light).md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UntravelledAvatarSizeProperties effectiveUntravelledAvatarSize = _getUntravelledAvatarSize(context, avatarSize);

    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ?? effectiveUntravelledAvatarSize.borderRadius;

    final resolvedBorderRadius = effectiveBorderRadius.resolve(Directionality.of(context));

    final Color effectiveBackgroundColor =
        backgroundColor ?? context.untravelledTheme?.avatarTheme.colors.backgroundColor ?? UntravelledColors.light.gohan;

    final Color effectiveBadgeColor =
        badgeColor ?? context.untravelledTheme?.avatarTheme.colors.badgeColor ?? UntravelledColors.light.roshi100;

    final Color effectiveTextColor = context.untravelledTheme?.avatarTheme.colors.textColor ?? UntravelledColors.light.textPrimary;

    final Color effectiveIconColor = context.untravelledTheme?.avatarTheme.colors.iconColor ?? UntravelledColors.light.iconPrimary;

    final double effectiveAvatarHeight = height ?? effectiveUntravelledAvatarSize.avatarSizeValue;

    final double effectiveAvatarWidth = width ?? effectiveUntravelledAvatarSize.avatarSizeValue;

    final double effectiveBadgeMarginValue = badgeMarginValue ?? effectiveUntravelledAvatarSize.badgeMarginValue;

    final double effectiveBadgeSize = badgeSize ?? effectiveUntravelledAvatarSize.badgeSizeValue;

    return Semantics(
      label: semanticLabel,
      button: false,
      focusable: false,
      image: backgroundImage != null,
      child: SizedBox(
        width: effectiveAvatarWidth,
        height: effectiveAvatarHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipPath(
                // TODO: Since clipper does not work properly on mobile web/PWA, we are disabling it. Remove this check
                // when it has been fixed from Flutter side.
                clipper: kIsWeb && MediaQueryData.fromView(View.of(context)).size.width < 500
                    ? null
                    : AvatarClipper(
                        showBadge: showBadge,
                        width: effectiveAvatarWidth,
                        height: effectiveAvatarHeight,
                        borderRadius: resolvedBorderRadius,
                        badgeSize: effectiveBadgeSize,
                        badgeMarginValue: effectiveBadgeMarginValue,
                        badgeAlignment: badgeAlignment,
                        textDirection: Directionality.of(context),
                      ),
                child: DefaultTextStyle(
                  style: effectiveUntravelledAvatarSize.textStyle.copyWith(color: effectiveTextColor),
                  child: IconTheme(
                    data: IconThemeData(
                      color: effectiveIconColor,
                    ),
                    child: DecoratedBox(
                      decoration: ShapeDecorationWithPremultipliedAlpha(
                        color: effectiveBackgroundColor,
                        image: backgroundImage != null
                            ? DecorationImage(
                                image: backgroundImage!,
                                fit: BoxFit.cover,
                              )
                            : null,
                        shape: UntravelledSquircleBorder(
                          borderRadius: resolvedBorderRadius.squircleBorderRadius(context),
                        ),
                      ),
                      child: Center(child: content),
                    ),
                  ),
                ),
              ),
            ),
            if (showBadge)
              Align(
                alignment: _avatarAlignmentMapper(context),
                child: Container(
                  height: effectiveBadgeSize,
                  width: effectiveBadgeSize,
                  decoration: BoxDecoration(
                    color: effectiveBadgeColor,
                    borderRadius: BorderRadius.circular(effectiveBadgeSize / 2),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
