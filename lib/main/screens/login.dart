import 'package:flow_go/main/components/text-link.dart';
import 'package:flow_go/main/screens/login/form.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Log Into My Account',
                style: Theme.of(context).textTheme.headline2,
              ),
              LoginForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLink(
                    label: 'Dont have an account?',
                  ),
                  TextLink(
                    label: 'Forgot password?',
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
