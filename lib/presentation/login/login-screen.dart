import 'package:flutter/material.dart';
import 'package:string_ops/string_ops.dart';

import '../core/elements/elements.dart';
import '../screens.dart';
import 'login-form.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      children: [
        Text(
          'log into my account'.convertCasing(CasingFormat.titleCase),
          style: Theme.of(context).textTheme.headline2,
        ),
        LoginForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextLink(
              route: '/create-account',
              label: 'Dont have an account?',
            ),
            TextLink(
              route: '/reset-password',
              label: 'Forgot password?',
            )
          ],
        )
      ],
    );
  }
}
