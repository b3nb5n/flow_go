import 'package:flutter/material.dart';
import 'package:string_ops/string_ops.dart';

import '../core/elements/elements.dart';
import '../screens.dart';
import 'create-account-form.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      children: [
        Text(
          'Start editing for free'.convertCasing(CasingFormat.titleCase),
          style: Theme.of(context).textTheme.headline2,
        ),
        CreateAccountForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextLink(
              route: '/login',
              label: 'Already have an account?',
            ),
          ],
        )
      ],
    );
  }
}
