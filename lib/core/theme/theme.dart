import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/tab_bar/tab_bar_theme.dart';
import 'package:untravelled_app/core/theme/tag/tag_theme.dart';
import 'package:untravelled_app/core/theme/tokens/transitions.dart';
import 'package:untravelled_app/core/untravelled_design.dart';

@immutable
class UntravelledTheme extends ThemeExtension<UntravelledTheme> with DiagnosticableTreeMixin {
  ///Untravelled Design System tokens.
  final UntravelledTokens tokens;

  /// Untravelled Design System UntravelledAccordion widget theming.
  final UntravelledAccordionTheme accordionTheme;

  /// Untravelled Design System UntravelledAlert widget theming.
  final UntravelledAlertTheme alertTheme;

  /// Untravelled Design System UntravelledAuthCode widget theming.
  final UntravelledAuthCodeTheme authCodeTheme;

  /// Untravelled Design System UntravelledAvatar widget theming.
  final UntravelledAvatarTheme avatarTheme;

  /// Untravelled Design System UntravelledButton widgets theming.
  final UntravelledBottomSheetTheme bottomSheetTheme;

  /// Untravelled Design System UntravelledButton widgets theming.
  final UntravelledButtonTheme buttonTheme;

  /// Untravelled Design System UntravelledCarousel widget theming.
  final UntravelledCarouselTheme carouselTheme;

  /// Untravelled Design System UntravelledCheckbox widget theming.
  final UntravelledCheckboxTheme checkboxTheme;

  /// Untravelled Design System UntravelledChip widgets theming.
  final UntravelledChipTheme chipTheme;

  /// Untravelled Design System UntravelledCircularLoader widget theming.
  final UntravelledCircularLoaderTheme circularLoaderTheme;

  /// Untravelled Design System UntravelledCircularProgress widget theming.
  final UntravelledCircularProgressTheme circularProgressTheme;

  /// Untravelled Design System UntravelledDotIndicator widget theming.
  final UntravelledDotIndicatorTheme dotIndicatorTheme;

  /// Untravelled Design System UntravelledDrawer widget theming.
  final UntravelledDrawerTheme drawerTheme;

  /// Untravelled Design System effects.
  final UntravelledEffectsTheme effects;

  /// Untravelled Design System UntravelledLinearLoader widget theming.
  final UntravelledLinearLoaderTheme linearLoaderTheme;

  /// Untravelled Design System UntravelledLinearProgress widget theming.
  final UntravelledLinearProgressTheme linearProgressTheme;

  /// Untravelled Design System UntravelledMenuItem widget theming.
  final UntravelledMenuItemTheme menuItemTheme;

  /// Untravelled Design System UntravelledModal widget theming.
  final UntravelledModalTheme modalTheme;

  /// Untravelled Design System UntravelledPopover widget theming.
  final UntravelledPopoverTheme popoverTheme;

  /// Untravelled Design System UntravelledProgressPin widget theming.
  final UntravelledProgressPinTheme progressPinTheme;

  /// Untravelled Design System UntravelledRadio widget theming.
  final UntravelledRadioTheme radioTheme;

  /// Untravelled Design System UntravelledSegmentedControl widget theming.
  final UntravelledSegmentedControlTheme segmentedControlTheme;

  /// Untravelled Design System UntravelledSwitch widget theming.
  final UntravelledSwitchTheme switchTheme;

  /// Untravelled Design System UntravelledTabBar widget theming.
  final UntravelledTabBarTheme tabBarTheme;

  /// Untravelled Design System UntravelledTag widget theming.
  final UntravelledTagTheme tagTheme;

  /// Untravelled Design System UntravelledTextArea widget theming.
  final UntravelledTextAreaTheme textAreaTheme;

  /// Untravelled Design System UntravelledTextInput widget theming.
  final UntravelledTextInputTheme textInputTheme;

  /// Untravelled Design System UntravelledTextInputGroup widget theming.
  final UntravelledTextInputGroupTheme textInputGroupTheme;

  /// Untravelled Design System UntravelledToast widget theming.
  final UntravelledToastTheme toastTheme;

  /// Untravelled Design System UntravelledTooltip widget theming.
  final UntravelledTooltipTheme tooltipTheme;

  UntravelledTheme({
    required this.tokens,
    UntravelledAccordionTheme? accordionTheme,
    UntravelledAlertTheme? alertTheme,
    UntravelledAuthCodeTheme? authCodeTheme,
    UntravelledAvatarTheme? avatarTheme,
    UntravelledBottomSheetTheme? bottomSheetTheme,
    UntravelledButtonTheme? buttonTheme,
    UntravelledCarouselTheme? carouselTheme,
    UntravelledCheckboxTheme? checkboxTheme,
    UntravelledChipTheme? chipTheme,
    UntravelledCircularLoaderTheme? circularLoaderTheme,
    UntravelledCircularProgressTheme? circularProgressTheme,
    UntravelledDotIndicatorTheme? dotIndicatorTheme,
    UntravelledDrawerTheme? drawerTheme,
    UntravelledEffectsTheme? effects,
    UntravelledLinearLoaderTheme? linearLoaderTheme,
    UntravelledLinearProgressTheme? linearProgressTheme,
    UntravelledMenuItemTheme? menuItemTheme,
    UntravelledModalTheme? modalTheme,
    UntravelledPopoverTheme? popoverTheme,
    UntravelledProgressPinTheme? progressPinTheme,
    UntravelledRadioTheme? radioTheme,
    UntravelledSegmentedControlTheme? segmentedControlTheme,
    UntravelledSwitchTheme? switchTheme,
    UntravelledTabBarTheme? tabBarTheme,
    UntravelledTagTheme? tagTheme,
    UntravelledTextAreaTheme? textAreaTheme,
    UntravelledTextInputTheme? textInputTheme,
    UntravelledTextInputGroupTheme? textInputGroupTheme,
    UntravelledToastTheme? toastTheme,
    UntravelledTooltipTheme? tooltipTheme,
  })  : accordionTheme = accordionTheme ?? UntravelledAccordionTheme(tokens: tokens),
        alertTheme = alertTheme ?? UntravelledAlertTheme(tokens: tokens),
        authCodeTheme = authCodeTheme ?? UntravelledAuthCodeTheme(tokens: tokens),
        avatarTheme = avatarTheme ?? UntravelledAvatarTheme(tokens: tokens),
        bottomSheetTheme = bottomSheetTheme ?? UntravelledBottomSheetTheme(tokens: tokens),
        buttonTheme = buttonTheme ?? UntravelledButtonTheme(tokens: tokens),
        carouselTheme = carouselTheme ?? UntravelledCarouselTheme(tokens: tokens),
        checkboxTheme = checkboxTheme ?? UntravelledCheckboxTheme(tokens: tokens),
        chipTheme = chipTheme ?? UntravelledChipTheme(tokens: tokens),
        circularLoaderTheme = circularLoaderTheme ?? UntravelledCircularLoaderTheme(tokens: tokens),
        circularProgressTheme = circularProgressTheme ?? UntravelledCircularProgressTheme(tokens: tokens),
        dotIndicatorTheme = dotIndicatorTheme ?? UntravelledDotIndicatorTheme(tokens: tokens),
        drawerTheme = drawerTheme ?? UntravelledDrawerTheme(tokens: tokens),
        effects = effects ?? UntravelledEffectsTheme(tokens: tokens),
        linearLoaderTheme = linearLoaderTheme ?? UntravelledLinearLoaderTheme(tokens: tokens),
        linearProgressTheme = linearProgressTheme ?? UntravelledLinearProgressTheme(tokens: tokens),
        menuItemTheme = menuItemTheme ?? UntravelledMenuItemTheme(tokens: tokens),
        modalTheme = modalTheme ?? UntravelledModalTheme(tokens: tokens),
        popoverTheme = popoverTheme ?? UntravelledPopoverTheme(tokens: tokens),
        progressPinTheme = progressPinTheme ?? UntravelledProgressPinTheme(tokens: tokens),
        radioTheme = radioTheme ?? UntravelledRadioTheme(tokens: tokens),
        segmentedControlTheme = segmentedControlTheme ?? UntravelledSegmentedControlTheme(tokens: tokens),
        switchTheme = switchTheme ?? UntravelledSwitchTheme(tokens: tokens),
        tabBarTheme = tabBarTheme ?? UntravelledTabBarTheme(tokens: tokens),
        tagTheme = tagTheme ?? UntravelledTagTheme(tokens: tokens),
        textAreaTheme = textAreaTheme ?? UntravelledTextAreaTheme(tokens: tokens),
        textInputTheme = textInputTheme ?? UntravelledTextInputTheme(tokens: tokens),
        textInputGroupTheme = textInputGroupTheme ?? UntravelledTextInputGroupTheme(tokens: tokens),
        toastTheme = toastTheme ?? UntravelledToastTheme(tokens: tokens),
        tooltipTheme = tooltipTheme ?? UntravelledTooltipTheme(tokens: tokens);

  @override
  UntravelledTheme copyWith({
    UntravelledTokens? tokens,
    UntravelledAccordionTheme? accordionTheme,
    UntravelledAlertTheme? alertTheme,
    UntravelledAuthCodeTheme? authCodeTheme,
    UntravelledAvatarTheme? avatarTheme,
    UntravelledBottomSheetTheme? bottomSheetTheme,
    UntravelledButtonTheme? buttonTheme,
    UntravelledCarouselTheme? carouselTheme,
    UntravelledCheckboxTheme? checkboxTheme,
    UntravelledChipTheme? chipTheme,
    UntravelledCircularLoaderTheme? circularLoaderTheme,
    UntravelledCircularProgressTheme? circularProgressTheme,
    UntravelledDotIndicatorTheme? dotIndicatorTheme,
    UntravelledDrawerTheme? drawerTheme,
    UntravelledEffectsTheme? effects,
    UntravelledLinearLoaderTheme? linearLoaderTheme,
    UntravelledLinearProgressTheme? linearProgressTheme,
    UntravelledMenuItemTheme? menuItemTheme,
    UntravelledModalTheme? modalTheme,
    UntravelledPopoverTheme? popoverTheme,
    UntravelledProgressPinTheme? progressPinTheme,
    UntravelledRadioTheme? radioTheme,
    UntravelledSegmentedControlTheme? segmentedControlTheme,
    UntravelledSwitchTheme? switchTheme,
    UntravelledTabBarTheme? tabBarTheme,
    UntravelledTagTheme? tagTheme,
    UntravelledTextAreaTheme? textAreaTheme,
    UntravelledTextInputTheme? textInputTheme,
    UntravelledTextInputGroupTheme? textInputGroupTheme,
    UntravelledToastTheme? toastTheme,
    UntravelledTooltipTheme? tooltipTheme,
  }) {
    return UntravelledTheme(
      tokens: tokens ?? this.tokens,
      accordionTheme: accordionTheme ?? this.accordionTheme,
      alertTheme: alertTheme ?? this.alertTheme,
      authCodeTheme: authCodeTheme ?? this.authCodeTheme,
      avatarTheme: avatarTheme ?? this.avatarTheme,
      bottomSheetTheme: bottomSheetTheme ?? this.bottomSheetTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      carouselTheme: carouselTheme ?? this.carouselTheme,
      checkboxTheme: checkboxTheme ?? this.checkboxTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      circularLoaderTheme: circularLoaderTheme ?? this.circularLoaderTheme,
      circularProgressTheme: circularProgressTheme ?? this.circularProgressTheme,
      dotIndicatorTheme: dotIndicatorTheme ?? this.dotIndicatorTheme,
      drawerTheme: drawerTheme ?? this.drawerTheme,
      effects: effects ?? this.effects,
      linearLoaderTheme: linearLoaderTheme ?? this.linearLoaderTheme,
      linearProgressTheme: linearProgressTheme ?? this.linearProgressTheme,
      menuItemTheme: menuItemTheme ?? this.menuItemTheme,
      modalTheme: modalTheme ?? this.modalTheme,
      popoverTheme: popoverTheme ?? this.popoverTheme,
      progressPinTheme: progressPinTheme ?? this.progressPinTheme,
      radioTheme: radioTheme ?? this.radioTheme,
      segmentedControlTheme: segmentedControlTheme ?? this.segmentedControlTheme,
      switchTheme: switchTheme ?? this.switchTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
      tagTheme: tagTheme ?? this.tagTheme,
      textAreaTheme: textAreaTheme ?? this.textAreaTheme,
      textInputTheme: textInputTheme ?? this.textInputTheme,
      textInputGroupTheme: textInputGroupTheme ?? this.textInputGroupTheme,
      toastTheme: toastTheme ?? this.toastTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
    );
  }

  @override
  UntravelledTheme lerp(ThemeExtension<UntravelledTheme>? other, double t) {
    if (other is! UntravelledTheme) return this;

    return UntravelledTheme(
      tokens: tokens.lerp(other.tokens, t),
      accordionTheme: accordionTheme.lerp(other.accordionTheme, t),
      alertTheme: alertTheme.lerp(other.alertTheme, t),
      authCodeTheme: authCodeTheme.lerp(other.authCodeTheme, t),
      avatarTheme: avatarTheme.lerp(other.avatarTheme, t),
      bottomSheetTheme: bottomSheetTheme.lerp(other.bottomSheetTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      carouselTheme: carouselTheme.lerp(other.carouselTheme, t),
      checkboxTheme: checkboxTheme.lerp(other.checkboxTheme, t),
      chipTheme: chipTheme.lerp(other.chipTheme, t),
      circularLoaderTheme: circularLoaderTheme.lerp(other.circularLoaderTheme, t),
      circularProgressTheme: circularProgressTheme.lerp(other.circularProgressTheme, t),
      dotIndicatorTheme: dotIndicatorTheme.lerp(other.dotIndicatorTheme, t),
      drawerTheme: drawerTheme.lerp(other.drawerTheme, t),
      effects: effects.lerp(other.effects, t),
      linearLoaderTheme: linearLoaderTheme.lerp(other.linearLoaderTheme, t),
      linearProgressTheme: linearProgressTheme.lerp(other.linearProgressTheme, t),
      menuItemTheme: menuItemTheme.lerp(other.menuItemTheme, t),
      modalTheme: modalTheme.lerp(other.modalTheme, t),
      popoverTheme: popoverTheme.lerp(other.popoverTheme, t),
      progressPinTheme: progressPinTheme.lerp(other.progressPinTheme, t),
      radioTheme: radioTheme.lerp(other.radioTheme, t),
      segmentedControlTheme: segmentedControlTheme.lerp(other.segmentedControlTheme, t),
      switchTheme: switchTheme.lerp(other.switchTheme, t),
      tabBarTheme: tabBarTheme.lerp(other.tabBarTheme, t),
      tagTheme: tagTheme.lerp(other.tagTheme, t),
      textAreaTheme: textAreaTheme.lerp(other.textAreaTheme, t),
      textInputTheme: textInputTheme.lerp(other.textInputTheme, t),
      textInputGroupTheme: textInputGroupTheme.lerp(other.textInputGroupTheme, t),
      toastTheme: toastTheme.lerp(other.toastTheme, t),
      tooltipTheme: tooltipTheme.lerp(other.tooltipTheme, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "UntravelledTheme"))
      ..add(DiagnosticsProperty<UntravelledTokens>("UntravelledTokens", tokens))
      ..add(DiagnosticsProperty<UntravelledAccordionTheme>("UntravelledAccordionTheme", accordionTheme))
      ..add(DiagnosticsProperty<UntravelledAlertTheme>("UntravelledAlertTheme", alertTheme))
      ..add(DiagnosticsProperty<UntravelledAuthCodeTheme>("UntravelledAuthCodeTheme", authCodeTheme))
      ..add(DiagnosticsProperty<UntravelledAvatarTheme>("UntravelledAvatarTheme", avatarTheme))
      ..add(DiagnosticsProperty<UntravelledButtonTheme>("UntravelledButtonTheme", buttonTheme))
      ..add(DiagnosticsProperty<UntravelledCarouselTheme>("UntravelledCarouselTheme", carouselTheme))
      ..add(DiagnosticsProperty<UntravelledCheckboxTheme>("UntravelledCheckboxTheme", checkboxTheme))
      ..add(DiagnosticsProperty<UntravelledChipTheme>("UntravelledChipTheme", chipTheme))
      ..add(DiagnosticsProperty<UntravelledCircularLoaderTheme>("UntravelledCircularLoaderTheme", circularLoaderTheme))
      ..add(DiagnosticsProperty<UntravelledCircularProgressTheme>("UntravelledCircularProgressTheme", circularProgressTheme))
      ..add(DiagnosticsProperty<UntravelledDotIndicatorTheme>("UntravelledDotIndicatorTheme", dotIndicatorTheme))
      ..add(DiagnosticsProperty<UntravelledDrawerTheme>("UntravelledDrawerTheme", drawerTheme))
      ..add(DiagnosticsProperty<UntravelledEffectsTheme>("UntravelledEffectsTheme", effects))
      ..add(DiagnosticsProperty<UntravelledLinearLoaderTheme>("UntravelledLinearLoaderTheme", linearLoaderTheme))
      ..add(DiagnosticsProperty<UntravelledLinearProgressTheme>("UntravelledLinearProgressTheme", linearProgressTheme))
      ..add(DiagnosticsProperty<UntravelledMenuItemTheme>("UntravelledMenuItemTheme", menuItemTheme))
      ..add(DiagnosticsProperty<UntravelledModalTheme>("UntravelledModalTheme", modalTheme))
      ..add(DiagnosticsProperty<UntravelledPopoverTheme>("UntravelledPopoverTheme", popoverTheme))
      ..add(DiagnosticsProperty<UntravelledProgressPinTheme>("UntravelledProgressPinTheme", progressPinTheme))
      ..add(DiagnosticsProperty<UntravelledRadioTheme>("UntravelledRadioTheme", radioTheme))
      ..add(DiagnosticsProperty<UntravelledSegmentedControlTheme>("UntravelledSegmentedControlTheme", segmentedControlTheme))
      ..add(DiagnosticsProperty<UntravelledSwitchTheme>("UntravelledSwitchTheme", switchTheme))
      ..add(DiagnosticsProperty<UntravelledTabBarTheme>("UntravelledTabBarTheme", tabBarTheme))
      ..add(DiagnosticsProperty<UntravelledTagTheme>("UntravelledTagTheme", tagTheme))
      ..add(DiagnosticsProperty<UntravelledTextAreaTheme>("UntravelledTextAreaTheme", textAreaTheme))
      ..add(DiagnosticsProperty<UntravelledTextInputTheme>("UntravelledTextInputTheme", textInputTheme))
      ..add(DiagnosticsProperty<UntravelledTextInputGroupTheme>("UntravelledTextInputGroupTheme", textInputGroupTheme))
      ..add(DiagnosticsProperty<UntravelledToastTheme>("UntravelledToastTheme", toastTheme))
      ..add(DiagnosticsProperty<UntravelledTooltipTheme>("UntravelledTooltipTheme", tooltipTheme));
  }
}

extension UntravelledThemeX on BuildContext {
  UntravelledTheme? get untravelledTheme => Theme.of(this).extension<UntravelledTheme>();
  UntravelledBorders? get untravelledBorders => untravelledTheme?.tokens.borders;
  UntravelledColors? get untravelledColors => untravelledTheme?.tokens.colors;
  UntravelledEffectsTheme? get untravelledEffects => untravelledTheme?.effects;
  UntravelledOpacities? get untravelledOpacities => untravelledTheme?.tokens.opacities;
  UntravelledShadows? get untravelledShadows => untravelledTheme?.tokens.shadows;
  UntravelledSizes? get untravelledSizes => untravelledTheme?.tokens.sizes;
  UntravelledTransitions? get untravelledTransitions => untravelledTheme?.tokens.transitions;
  UntravelledTypography? get untravelledTypography => untravelledTheme?.tokens.typography;
}
