import 'package:flutter/material.dart';

import '../../pallette.dart';

class Button extends StatelessWidget {
  final void Function() handlePressed;
  final String label;

  Button({
    required this.handlePressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handlePressed,
      style: TextButton.styleFrom(
        primary: WebflowPallette.webflowBlue,
        elevation: 0,
        minimumSize: Size(double.maxFinite, 42),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: WebflowPallette.webflowBlue,
        onSurface: WebflowPallette.neutral,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
