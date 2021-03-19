import 'package:flow_go/presentation/core/elements/elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthCredentials {
  String username;
  String password;

  AuthCredentials({
    this.username = '',
    this.password = '',
  });

  @override
  String toString() {
    return '{ username: \'$username\', password: \'$password\' }';
  }
}

class LoginForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authCredentials = useState(AuthCredentials());

    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          TextInput(
            label: 'Email or Username',
            handleChange: (value) => authCredentials.value.username = value,
          ),
          TextInput(
            label: 'Password',
            obscureText: true,
            handleChange: (value) => authCredentials.value.password = value,
          ),
          Button(
            label: 'Log In',
            handlePressed: () => print(authCredentials.value),
          )
        ],
      ),
    );
  }
}
