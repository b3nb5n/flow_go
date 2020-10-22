import 'package:flutter/material.dart';

import '../../main.dart';

class Button extends StatelessWidget {
  final void Function() handlePressed;
  final String label;

  Button({this.handlePressed, this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: WebflowPallette.webflowBlue,
      onPressed: handlePressed,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
