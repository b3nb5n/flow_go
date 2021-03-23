import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../data/auth/credentials/auth-credentials.dart';
import '../core/elements/elements.dart';

class LoginForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authCredentials = useState(AuthCredentials());
    final errors = useState(AuthCredentialsErrors());

    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          TextInput(
            label: 'Email or Username',
            handleChange: (value) => authCredentials.value.identifier = value,
            error: errors.value.identifier,
          ),
          TextInput(
            label: 'Password',
            obscureText: true,
            handleChange: (value) => authCredentials.value.password = value,
            error: errors.value.password,
          ),
          Button(
            label: 'Log In',
            handlePressed: () {
              errors.value = authCredentials.value.validate();
              if (!errors.value.hasErrors) {
                final userIsValid = authCredentials.value.login();
                if (userIsValid) Navigator.pushReplacementNamed(context, '/');
              }
            },
          )
        ],
      ),
    );
  }
}
