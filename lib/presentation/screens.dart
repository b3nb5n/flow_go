import 'package:flutter/material.dart';

import '../data/utils/string-casing.dart';
import 'pallette.dart';

export 'create-account/create-account-screen.dart';
export 'login/login-screen.dart';

class Screen extends StatelessWidget {
  final Widget child;

  Screen({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WebflowPallette.neutral,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;

  AuthScreen({
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image(
                height: 24,
                image: AssetImage('assets/logos/webflow-logo-black.png'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.titleCase(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                ...children
              ],
            ),
          ],
        ),
      ),
    );
  }
}
