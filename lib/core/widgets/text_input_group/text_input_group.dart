import 'package:flutter/material.dart';

import 'package:untravelled_app/core/theme/theme.dart';
import 'package:untravelled_app/core/theme/tokens/colors.dart';
import 'package:untravelled_app/core/theme/tokens/sizes.dart';
import 'package:untravelled_app/core/theme/tokens/typography/typography.dart';
import 'package:untravelled_app/core/utils/extensions.dart';
import 'package:untravelled_app/core/utils/shape_decoration_premul.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_border.dart';
import 'package:untravelled_app/core/widgets/common/base_control.dart';
import 'package:untravelled_app/core/widgets/text_input/form_text_input.dart';

typedef UntravelledTextInputGroupErrorBuilder = Widget Function(BuildContext context, List<String> errorTexts);

class UntravelledTextInputGroup extends StatefulWidget {
  /// Used to enable/disable this TextInputGroup auto validation and update its error text.
  ///
  /// {@template flutter.widgets.FormField.autovalidateMode}
  /// If [AutovalidateMode.onUserInteraction], this TextInputGroup will only auto-validate after its content changes.
  /// If [AutovalidateMode.always], it will auto-validate even without user interaction. If [AutovalidateMode.disabled],
  ///  auto-validation will be disabled.
  ///
  /// Defaults to [AutovalidateMode.disabled], cannot be null.
  /// {@endtemplate}
  final AutovalidateMode autovalidateMode;

  /// If false the widget is "disabled": it ignores taps and has a reduced opacity.
  final bool enabled;

  /// The border radius of the text input group.
  final BorderRadiusGeometry? borderRadius;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip? clipBehavior;

  /// The background color of the text input group.
  final Color? backgroundColor;

  /// The border color of the inactive text input group.
  final Color? inactiveBorderColor;

  /// The color of the error state of text input group.
  final Color? errorColor;

  /// The text color of the hint in text input group.
  final Color? hintTextColor;

  /// The border color of the hovered text input group.
  final Color? hoverBorderColor;

  /// The text color of the text input group.
  final Color? textColor;

  /// The transition duration for disable animation.
  final Duration? transitionDuration;

  /// The transition curve for disable animation.
  final Curve? transitionCurve;

  /// The padding around helper widget or error builder.
  final EdgeInsetsGeometry? helperPadding;

  /// The padding around the text content.
  final EdgeInsetsGeometry? textPadding;

  /// Custom decoration for the text input group.
  final Decoration? decoration;

  /// The semantic label for the text input group widget.
  final String? semanticLabel;

  /// The text style to use for the helper or error state text.
  final TextStyle? helperTextStyle;

  /// The children of the text input group.
  final List<UntravelledFormTextInput> children;

  /// Builder for the error widget.
  final UntravelledTextInputGroupErrorBuilder? errorBuilder;

  /// The widget in the helper slot of the text input group.
  final Widget? helper;

  /// MDS TextInputGroup widget
  const UntravelledTextInputGroup({
    super.key,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enabled = true,
    this.borderRadius,
    this.clipBehavior,
    this.backgroundColor,
    this.inactiveBorderColor,
    this.errorColor,
    this.hintTextColor,
    this.hoverBorderColor,
    this.textColor,
    this.transitionDuration,
    this.transitionCurve,
    this.helperPadding,
    this.textPadding,
    this.decoration,
    this.semanticLabel,
    this.helperTextStyle,
    required this.children,
    this.errorBuilder,
    this.helper,
  });

  @override
  State<UntravelledTextInputGroup> createState() => _UntravelledTextInputGroupState();
}

class _UntravelledTextInputGroupState extends State<UntravelledTextInputGroup> {
  final Set<String> _validatorErrors = {};

  void _handleValidationError(String? errorText) {
    if (errorText != null) {
      _validatorErrors.add(errorText);
    } else {
      _validatorErrors.clear();
    }

    WidgetsBinding.instance.addPostFrameCallback((Duration _) {
      if (!mounted) return;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveBorderRadius = widget.borderRadius ??
        context.untravelledTheme?.textInputGroupTheme.properties.borderRadius ??
        BorderRadius.circular(8);

    final Color effectiveBackgroundColor = widget.backgroundColor ??
        context.untravelledTheme?.textInputGroupTheme.colors.backgroundColor ??
        UntravelledColors.light.gohan;

    final Color effectiveBorderColor = widget.inactiveBorderColor ??
        context.untravelledTheme?.textInputGroupTheme.colors.borderColor ??
        UntravelledColors.light.beerus;

    final Color effectiveErrorColor =
        widget.errorColor ?? context.untravelledTheme?.textInputGroupTheme.colors.errorColor ?? UntravelledColors.light.chiChi100;

    final Color effectiveHelperTextColor = widget.hintTextColor ??
        context.untravelledTheme?.textInputGroupTheme.colors.helperTextColor ??
        UntravelledColors.light.trunks;

    final EdgeInsetsGeometry effectiveHelperPadding = widget.helperPadding ??
        context.untravelledTheme?.textInputGroupTheme.properties.helperPadding ??
        EdgeInsets.symmetric(horizontal: UntravelledSizes.sizes.x3s, vertical: UntravelledSizes.sizes.x4s);

    final TextStyle effectiveHelperTextStyle = widget.helperTextStyle ??
        context.untravelledTheme?.textInputGroupTheme.properties.helperTextStyle ??
        UntravelledTypography.typography.body.text12;

    // TODO: Implement animations
    /* final Duration effectiveTransitionDuration = widget.transitionDuration ??
        context.untravelledTheme?.textInputGroupTheme.properties.transitionDuration ??
        UntravelledTransitions.transitions.defaultTransitionDuration;

    final Curve effectiveTransitionCurve = widget.transitionCurve ??
        context.untravelledTheme?.textInputGroupTheme.properties.transitionCurve ??
        UntravelledTransitions.transitions.defaultTransitionCurve; */

    List<Widget> childrenWithDivider({required bool shouldHideDivider}) => List.generate(
          widget.children.length * 2 - 1,
          (int index) {
            final int derivedIndex = index ~/ 2;

            final UntravelledFormTextInput child = UntravelledFormTextInput(
              activeBorderColor: widget.children[derivedIndex].activeBorderColor,
              autocorrect: widget.children[derivedIndex].autocorrect,
              autofillHints: widget.children[derivedIndex].autofillHints,
              autofocus: widget.children[derivedIndex].autofocus,
              autovalidateMode: widget.autovalidateMode,
              backgroundColor: Colors.transparent,
              borderRadius: widget.children[derivedIndex].borderRadius,
              canRequestFocus: widget.children[derivedIndex].canRequestFocus,
              clipBehavior: widget.children[derivedIndex].clipBehavior,
              contentInsertionConfiguration: widget.children[derivedIndex].contentInsertionConfiguration,
              contextMenuBuilder: widget.children[derivedIndex].contextMenuBuilder,
              controller: widget.children[derivedIndex].controller,
              cursorColor: widget.children[derivedIndex].cursorColor,
              cursorHeight: widget.children[derivedIndex].cursorHeight,
              cursorOpacityAnimates: widget.children[derivedIndex].cursorOpacityAnimates,
              cursorRadius: widget.children[derivedIndex].cursorRadius,
              cursorWidth: widget.children[derivedIndex].cursorWidth,
              decoration: widget.children[derivedIndex].decoration,
              dragStartBehavior: widget.children[derivedIndex].dragStartBehavior,
              enabled: widget.children[derivedIndex].enabled,
              enableIMEPersonalizedLearning: widget.children[derivedIndex].enableIMEPersonalizedLearning,
              enableInteractiveSelection: widget.children[derivedIndex].enableInteractiveSelection,
              enableSuggestions: widget.children[derivedIndex].enableSuggestions,
              errorColor: _validatorErrors.length == widget.children.length
                  ? Colors.transparent
                  : widget.children[derivedIndex].errorColor,
              expands: widget.children[derivedIndex].expands,
              focusNode: widget.children[derivedIndex].focusNode,
              gap: widget.children[derivedIndex].gap,
              hasFloatingLabel: widget.children[derivedIndex].hasFloatingLabel,
              height: widget.children[derivedIndex].height,
              helper: widget.children[derivedIndex].helper,
              helperPadding: widget.children[derivedIndex].helperPadding,
              helperTextStyle: widget.children[derivedIndex].helperTextStyle,
              hintText: widget.children[derivedIndex].hintText,
              hintTextColor: widget.children[derivedIndex].hintTextColor,
              hoverBorderColor: widget.children[derivedIndex].hoverBorderColor,
              inactiveBorderColor: Colors.transparent,
              initialValue: widget.children[derivedIndex].initialValue,
              inputFormatters: widget.children[derivedIndex].inputFormatters,
              keyboardAppearance: widget.children[derivedIndex].keyboardAppearance,
              keyboardType: widget.children[derivedIndex].keyboardType,
              leading: widget.children[derivedIndex].leading,
              magnifierConfiguration: widget.children[derivedIndex].magnifierConfiguration,
              maxLength: widget.children[derivedIndex].maxLength,
              maxLengthEnforcement: widget.children[derivedIndex].maxLengthEnforcement,
              maxLines: widget.children[derivedIndex].maxLines,
              minLines: widget.children[derivedIndex].minLines,
              mouseCursor: widget.children[derivedIndex].mouseCursor,
              obscureText: widget.children[derivedIndex].obscureText,
              obscuringCharacter: widget.children[derivedIndex].obscuringCharacter,
              onAppPrivateCommand: widget.children[derivedIndex].onAppPrivateCommand,
              onChanged: widget.children[derivedIndex].onChanged,
              onEditingComplete: widget.children[derivedIndex].onEditingComplete,
              onError: _handleValidationError,
              onSubmitted: widget.children[derivedIndex].onSubmitted,
              onTap: widget.children[derivedIndex].onTap,
              onTapOutside: widget.children[derivedIndex].onTapOutside,
              padding: widget.children[derivedIndex].padding,
              readOnly: widget.children[derivedIndex].readOnly,
              restorationId: widget.children[derivedIndex].restorationId,
              scribbleEnabled: widget.children[derivedIndex].scribbleEnabled,
              scrollController: widget.children[derivedIndex].scrollController,
              scrollPadding: widget.children[derivedIndex].scrollPadding,
              scrollPhysics: widget.children[derivedIndex].scrollPhysics,
              selectionControls: widget.children[derivedIndex].selectionControls,
              selectionHeightStyle: widget.children[derivedIndex].selectionHeightStyle,
              selectionWidthStyle: widget.children[derivedIndex].selectionWidthStyle,
              showCursor: widget.children[derivedIndex].showCursor,
              smartDashesType: widget.children[derivedIndex].smartDashesType,
              smartQuotesType: widget.children[derivedIndex].smartQuotesType,
              spellCheckConfiguration: widget.children[derivedIndex].spellCheckConfiguration,
              strutStyle: widget.children[derivedIndex].strutStyle,
              style: widget.children[derivedIndex].style,
              textAlign: widget.children[derivedIndex].textAlign,
              textAlignVertical: widget.children[derivedIndex].textAlignVertical,
              textCapitalization: widget.children[derivedIndex].textCapitalization,
              textColor: widget.children[derivedIndex].textColor,
              textDirection: widget.children[derivedIndex].textDirection,
              textInputAction: widget.children[derivedIndex].textInputAction,
              textInputSize: widget.children[derivedIndex].textInputSize,
              trailing: widget.children[derivedIndex].trailing,
              transitionCurve: widget.children[derivedIndex].transitionCurve,
              transitionDuration: widget.children[derivedIndex].transitionDuration,
              undoController: widget.children[derivedIndex].undoController,
              validator: widget.children[derivedIndex].validator,
            );

            return index.isEven
                ? child
                : Divider(
                    height: 1,
                    color: _validatorErrors.length == widget.children.length
                        ? effectiveErrorColor
                        : shouldHideDivider || _validatorErrors.isNotEmpty
                            ? Colors.transparent
                            : effectiveBorderColor,
                  );
          },
          growable: false,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UntravelledBaseControl(
          semanticLabel: widget.semanticLabel,
          isFocusable: false,
          showFocusEffect: false,
          onTap: widget.enabled ? () {} : null,
          builder: (BuildContext context, bool isEnabled, bool isHovered, bool isFocused, bool isPressed) {
            return Container(
              clipBehavior: widget.clipBehavior ?? Clip.none,
              decoration: widget.decoration ??
                  ShapeDecorationWithPremultipliedAlpha(
                    color: effectiveBackgroundColor,
                    shape: UntravelledSquircleBorder(
                      borderRadius: effectiveBorderRadius.squircleBorderRadius(context),
                      side: BorderSide(
                        color: _validatorErrors.length == widget.children.length
                            ? effectiveErrorColor
                            : effectiveBorderColor,
                      ),
                    ),
                  ),
              child: Column(
                children: childrenWithDivider(shouldHideDivider: isHovered || isFocused),
              ),
            );
          },
        ),
        if (widget.helper != null || (_validatorErrors.isNotEmpty && widget.errorBuilder != null))
          RepaintBoundary(
            child: IconTheme(
              data: IconThemeData(
                color: _validatorErrors.isNotEmpty && widget.errorBuilder != null
                    ? effectiveErrorColor
                    : effectiveHelperTextColor,
              ),
              child: DefaultTextStyle(
                style: effectiveHelperTextStyle.copyWith(
                  color: _validatorErrors.isNotEmpty && widget.errorBuilder != null
                      ? effectiveErrorColor
                      : effectiveHelperTextColor,
                ),
                child: Padding(
                  padding: effectiveHelperPadding,
                  child: _validatorErrors.isNotEmpty && widget.errorBuilder != null
                      ? widget.errorBuilder!(context, _validatorErrors.toList())
                      : widget.helper,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
