import 'package:flow_go/data/auth/user/user-provider.dart';
import 'package:flow_go/data/auth/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/elements/elements.dart';

class CreateAccountForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final user = useProvider(userNotifierProvider);
    final errors = useState(UserErrors());

    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: TextInput(
                  label: 'First Name',
                  handleChange: (value) => user.firstName = value,
                  defaultValue: user.firstName,
                  error: errors.value.firstName,
                ),
              ),
              Container(width: 12),
              Flexible(
                flex: 1,
                child: TextInput(
                  label: 'Last Name',
                  handleChange: (value) => user.lastName = value,
                  defaultValue: user.lastName,
                  error: errors.value.lastName,
                ),
              ),
            ],
          ),
          TextInput(
            label: 'Email',
            handleChange: (value) => user.email = value,
            defaultValue: user.lastName,
            error: errors.value.email,
          ),
          TextInput(
            label: 'Password',
            obscureText: true,
            handleChange: (value) => user.password = value,
            defaultValue: user.password,
            error: errors.value.password,
          ),
          Button(
            label: 'Create Account',
            handlePressed: () {
              errors.value = user.validate();
              if (!errors.value.hasErrors) {
                // sign up user
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          )
        ],
      ),
    );
  }
}
