import 'package:flow_go/main.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String label;
  final bool password;
  final void Function(String value) handleChange;

  TextInput({this.label, this.handleChange, this.password});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _focus = FocusNode();
  bool focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      focused = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: widget.password ?? false,
        focusNode: _focus,
        onChanged: widget.handleChange,
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          hintText: widget.label,
          border: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: WebflowPallette.neutral[300],
            ),
          ),
          filled: !focused,
          fillColor: WebflowPallette.neutral[200],
          focusColor: WebflowPallette.neutral,
        ),
      ),
    );
  }
}
