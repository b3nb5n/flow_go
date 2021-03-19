import 'package:flutter/material.dart';

import '../../../data/utils/string-casing.dart';
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
      style: TextButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.maxFinite, 42),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: WebflowPallette.webflowBlue,
      ),
      onPressed: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        handlePressed();
      },
      child: Text(
        label.titleCase(),
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
