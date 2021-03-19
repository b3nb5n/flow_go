import 'package:flutter/material.dart';

import '../../pallette.dart';

class TextLink extends StatelessWidget {
  final String route;
  final String label;

  TextLink({
    required this.route,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: WebflowPallette.neutral[700],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
