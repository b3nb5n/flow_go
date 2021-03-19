import 'package:flow_go/presentation/core/elements/text-input/text-input-error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../pallette.dart';

class TextInput extends HookWidget {
  final String label;
  final bool isRequired;
  final bool obscureText;
  final RegExp? validator;
  final void Function(String value) handleChange;
  final FocusNode _focus = FocusNode();

  TextInput({
    required this.label,
    required this.handleChange,
    this.isRequired = false,
    this.obscureText = false,
    this.validator,
  });

  String? value;
  String? error;

  String? validateInput(String? value) {
    if (isRequired && (value == null || value.isEmpty)) {
      return '$label is required';
    }

    value = value ?? '';
    if (validator != null && validator!.hasMatch(value)) {
      return 'invalid $label';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final focused = useState(false);

    useEffect(() {
      _focus.addListener(() {
        focused.value = _focus.hasFocus;
      });

      return () {};
    });

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            obscureText: obscureText,
            focusNode: _focus,
            onChanged: handleChange,
            cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              hintText: label,
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: WebflowPallette.neutral[300]!,
                ),
              ),
              filled: !focused.value,
              fillColor: WebflowPallette.neutral[200],
              focusColor: WebflowPallette.neutral,
            ),
          ),
          TextInputError(error: 'Last name is required')
        ],
      ),
    );
  }
}
