import 'package:flow_go/presentation/core/elements/text-input/text-input-error.dart';
import 'package:flutter/material.dart';

import '../../../pallette.dart';

class TextInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String? defaultValue;
  final String? error;
  final void Function(String value) handleChange;

  TextInput({
    required this.label,
    required this.handleChange,
    this.obscureText = false,
    this.defaultValue,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            obscureText: obscureText,
            onChanged: (value) {
              handleChange(value);
            },
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
              filled: true,
              fillColor: WebflowPallette.neutral[200],
              focusColor: WebflowPallette.neutral,
            ),
          ),
          if (error != null && error!.isNotEmpty) ...[
            TextInputError(error: error!)
          ]
        ],
      ),
    );
  }
}
