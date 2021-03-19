import 'package:flow_go/presentation/create-account/create-account-form.dart';
import 'package:flutter/material.dart';

import '../core/elements/elements.dart';
import '../screens.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: 'Start editing for free',
      children: [
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
