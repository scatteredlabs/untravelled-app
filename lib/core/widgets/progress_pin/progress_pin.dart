import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/widgets/progress_pin/pin_style.dart';
import 'package:untravelled_app/core/widgets/progress_pin/progress_pin_painter.dart';

class UntravelledProgressPin extends StatelessWidget {
  final double progressValue;
  final PinStyle? pinStyle;
  final String progressLabel;
  final Widget child;

  const UntravelledProgressPin({
    super.key,
    required this.progressValue,
    required this.child,
    this.pinStyle,
    required this.progressLabel,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectivePinColor =
        pinStyle?.pinColor ?? context.untravelledTheme?.progressPinTheme.colors.pinColor ?? UntravelledColors.light.popo;

    final Color effectivePinBorderColor =
        pinStyle?.pinBorderColor ?? context.untravelledTheme?.progressPinTheme.colors.pinBorderColor ?? UntravelledColors.light.goten;

    final Color effectiveKnobColor =
        pinStyle?.thumbColor ?? context.untravelledTheme?.progressPinTheme.colors.thumbColor ?? UntravelledColors.light.goten;

    final Color effectiveShadowColor =
        pinStyle?.shadowColor ?? context.untravelledTheme?.progressPinTheme.colors.shadowColor ?? UntravelledColors.light.popo;

    final Color effectiveTextColor =
        pinStyle?.textStyle?.color ?? context.untravelledTheme?.progressPinTheme.colors.textColor ?? UntravelledColors.light.goten;

    final TextStyle effectiveTextStyle = pinStyle?.textStyle ??
        context.untravelledTheme?.progressPinTheme.properties.textStyle ??
        UntravelledTypography.typography.caption.text10.copyWith(letterSpacing: 0.5);

    final double effectiveKnobWidthMultiplier =
        context.untravelledTheme?.progressPinTheme.properties.thumbWidthMultiplier ?? 1.5;

    final double effectivePinWidth =
        pinStyle?.pinWidth ?? context.untravelledTheme?.progressPinTheme.properties.pinWidth ?? 36;

    final double effectivePinBorderWidth =
        pinStyle?.pinBorderWidth ?? context.untravelledTheme?.progressPinTheme.properties.pinBorderWidth ?? 2;

    final double effectivePinDistance =
        pinStyle?.pinDistance ?? context.untravelledTheme?.progressPinTheme.properties.pinDistance ?? 6;

    final double effectiveShadowElevation =
        pinStyle?.shadowElevation ?? context.untravelledTheme?.progressPinTheme.properties.shadowElevation ?? 6;

    final TextDirection effectiveTextDirection = Directionality.of(context);

    return CustomPaint(
      foregroundPainter: ProgressPinPainter(
        showShadow: pinStyle?.showShadow ?? true,
        pinColor: effectivePinColor,
        thumbColor: effectiveKnobColor,
        shadowColor: effectiveShadowColor,
        pinBorderColor: effectivePinBorderColor,
        pinBorderWidth: effectivePinBorderWidth,
        pinDistance: effectivePinDistance,
        pinWidth: effectivePinWidth,
        thumbWidth: pinStyle?.thumbWidth,
        thumbWidthMultiplier: effectiveKnobWidthMultiplier,
        progressValue: progressValue,
        shadowElevation: effectiveShadowElevation,
        labelText: progressLabel,
        textDirection: effectiveTextDirection,
        textStyle: effectiveTextStyle.copyWith(color: effectiveTextColor),
      ),
      child: child,
    );
  }
}
