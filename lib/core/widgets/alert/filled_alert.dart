import 'package:flutter/material.dart';

import 'package:untravelled_app/core/widgets/alert/alert.dart';
import 'package:untravelled_app/core/widgets/buttons/button.dart';
import 'package:untravelled_app/core/widgets/common/icons/icons.dart';
import 'package:untravelled_app/core/widgets/common/icons/Untravelled_icon.dart';

class UntravelledFilledAlert extends StatelessWidget {
  /// Controls whether the alert is shown.
  final bool show;

  /// The border radius of the alert.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the alert.
  final Color color;

  /// The semantic label for the alert.
  final String? semanticLabel;

  /// The callback that is called when the trailing slot widget is tapped.
  final VoidCallback? onTrailingTap;

  /// The widget in the leading slot of the alert.
  final Widget? leading;

  /// The widget in the title slot of the alert.
  final Widget title;

  /// The widget in the body slot of the alert.
  final Widget? body;

  /// MDS filled alert variant.
  ///
  /// See also:
  ///
  ///   * [UntravelledOutlinedAlert], MDS outlined button.
  const UntravelledFilledAlert({
    super.key,
    this.show = false,
    this.borderRadius,
    required this.color,
    this.semanticLabel,
    this.onTrailingTap,
    this.leading,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedBackgroundColor = color.withOpacity(0.1);

    final effectiveTrailing = UntravelledButton.icon(
      onTap: onTrailingTap,
      semanticLabel: semanticLabel,
      buttonSize: UntravelledButtonSize.xs,
      borderRadius: borderRadius,
      disabledOpacityValue: 1,
      icon: UntravelledIcon(
        UntravelledIcons.close_small_24,
        color: color,
        size: 24,
      ),
      gap: 0,
    );

    return UntravelledAlert(
      show: show,
      borderRadius: borderRadius,
      semanticLabel: semanticLabel,
      leading: leading,
      title: title,
      trailing: effectiveTrailing,
      body: body,
      backgroundColor: resolvedBackgroundColor,
      color: color,
    );
  }
}
