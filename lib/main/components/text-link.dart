import 'package:flow_go/main.dart';
import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String route;
  final String label;

  TextLink({this.route, this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: WebflowPallette.neutral[700],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
