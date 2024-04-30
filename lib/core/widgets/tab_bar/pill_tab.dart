import 'package:flutter/material.dart';

import 'package:untravelled_app/core/widgets/tab_bar/pill_tab_style.dart';

class UntravelledPillTab {
  /// Controls whether this tab is disabled.
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}.
  final bool autoFocus;

  /// Whether this tab should be focusable.
  final bool isFocusable;

  /// Whether this tab should show a focus effect.
  final bool showFocusEffect;

  /// {@macro flutter.widgets.Focus.focusNode}.
  final FocusNode? focusNode;

  /// The styling options for the tab.
  final UntravelledPillTabStyle? tabStyle;

  /// The semantic label for the tab.
  final String? semanticLabel;

  /// Callback that returns boolean value if tab is currently selected or not.
  final ValueChanged<bool>? isSelected;

  /// The widget in the leading slot of the tab.
  final Widget? leading;

  /// The widget in the label slot of the tab.
  final Widget? label;

  /// The widget in the trailing slot of the tab.
  final Widget? trailing;

  const UntravelledPillTab({
    this.disabled = false,
    this.autoFocus = false,
    this.isFocusable = true,
    this.showFocusEffect = true,
    this.focusNode,
    this.tabStyle,
    this.semanticLabel,
    this.isSelected,
    this.leading,
    this.label,
    this.trailing,
  });
}
