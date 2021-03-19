import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../pallette.dart';

class TextInput extends HookWidget {
  final String label;
  final bool obscureText;
  final void Function(String value) handleChange;
  final FocusNode _focus = FocusNode();

  TextInput({
    required this.label,
    required this.handleChange,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final focused = useState(false);

    useEffect(() {
      _focus.addListener(() {
        focused.value = _focus.hasFocus;
      });

      return () {};
    });

    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
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
    );
  }
}
