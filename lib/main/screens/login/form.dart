import 'package:flow_go/main/components/button.dart';
import 'package:flow_go/main/components/text-input.dart';
import 'package:flutter/material.dart';

class AuthData {
  String username;
  String password;

  AuthData({this.username, this.password});
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthData authData = AuthData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 32,
      ),
      child: Column(
        children: [
          TextInput(
            label: 'Email or Username',
            handleChange: (value) {
              setState(() => authData.username = value);
            },
          ),
          TextInput(
            label: 'Password',
            password: true,
            handleChange: (value) {
              setState(() => authData.password = value);
            },
          ),
          Button(
            label: 'Log In',
            handlePressed: () {
              print(authData.username);
              print(authData.password);
            },
          )
        ],
      ),
    );
  }
}
