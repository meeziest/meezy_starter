import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meezy_ui/meezy_ui.dart';

class BigInputField extends StatefulWidget {
  final double height;
  final String? labelText;
  final TextStyle? floatingLabelTextStyle;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final String? underTitle;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChange;
  final List<Widget>? prefixWidgets;
  final List<Widget>? suffixWidgets;
  final Color? fillColor;
  final EdgeInsets? padding;
  final bool? enabled;
  final int? maxLength;
  final int? errorMaxLines;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final void Function(PointerDownEvent)? onTapOutside;

  const BigInputField({
    super.key,
    this.labelText,
    this.hintText,
    this.underTitle,
    this.floatingLabelTextStyle,
    this.labelTextStyle,
    this.hintTextStyle,
    this.focusNode,
    this.onSubmit,
    this.onChange,
    this.controller,
    this.prefixWidgets,
    this.padding,
    this.suffixWidgets,
    this.fillColor,
    this.inputFormatters,
    this.enabled,
    this.maxLength,
    this.errorMaxLines,
    this.readOnly = false,
    this.errorText,
    this.height = 140,
    this.autofocus = false,
    this.textInputAction,
    this.onTapOutside,
  });

  @override
  State<BigInputField> createState() => _BigInputFieldState();
}

class _BigInputFieldState extends State<BigInputField> {
  ValueNotifier<int> numLines = ValueNotifier(0);
  TextEditingController? controller;
  FocusNode? focusNode;
  // Size? preComputedTextFieldSize;
  // double? maxWidth;

  late final textFieldTextStyle = context.textStyles.bodyMedium?.copyWith(
    decoration: TextDecoration.none,
    decorationThickness: 0,
  );

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.height,
            child: TextField(
              key: const ValueKey('question_message_input_field'),
              textInputAction: widget.textInputAction,
              onTapOutside: widget.onTapOutside,
              autofocus: widget.autofocus,
              maxLength: widget.maxLength,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              expands: true,
              maxLines: null,
              focusNode: focusNode,
              onSubmitted: widget.onSubmit,
              onChanged: widget.onChange,
              controller: controller,
              cursorWidth: 1.5,
              cursorHeight: 15,
              cursorColor: context.colorScheme.onPrimary,
              style: textFieldTextStyle,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                filled: true,
                isDense: false,
                fillColor: widget.fillColor,
                constraints: const BoxConstraints.tightFor(height: 56),
                labelText: widget.labelText,
                floatingLabelStyle: widget.floatingLabelTextStyle,
                labelStyle: widget.labelTextStyle,
                hintStyle: widget.hintTextStyle,
                errorText: widget.errorText,
                errorMaxLines: widget.errorMaxLines,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: widget.hintText,
                prefixIconConstraints: const BoxConstraints(maxWidth: 150, maxHeight: 150),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          if (widget.underTitle != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.underTitle!,
                style: widget.labelTextStyle,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }
}
