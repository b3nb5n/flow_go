import 'package:flutter/material.dart';

import '../core/elements/elements.dart';

class CreateAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextInput(
                  label: 'First Name',
                  handleChange: print,
                ),
              ),
              Container(width: 12),
              Flexible(
                flex: 1,
                child: TextInput(
                  label: 'Last Name',
                  handleChange: print,
                ),
              ),
            ],
          ),
          TextInput(label: 'Email', handleChange: print),
          TextInput(
            label: 'Password',
            obscureText: true,
            handleChange: print,
          ),
          Button(
            label: 'Create Account',
            handlePressed: () {},
          )
        ],
      ),
    );
  }
}
