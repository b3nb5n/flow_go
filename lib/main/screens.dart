import 'package:flow_go/main.dart';
import 'package:flutter/material.dart';

export 'screens/login.dart';

class Screen extends StatelessWidget {
  final Widget screen;

  Screen(this.screen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WebflowPallette.neutral,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: screen,
        ),
      ),
    );
  }
}
