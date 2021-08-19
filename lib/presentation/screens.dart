import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../data/auth/user/user-provider.dart';
import 'pallette.dart';

export 'create-account/create-account-screen.dart';
export 'dashboard/dashboard-screen.dart';
export 'login/login-screen.dart';

class Screen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? header;
  final List<Widget> children;
  final Widget? footer;
  final Color? backgroundColor;

  Screen({
    required this.children,
    this.appBar,
    this.header,
    this.footer,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (appBar == null) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }

    return Scaffold(
      appBar: appBar ??
          AppBar(
            foregroundColor: WebflowPallette.neutral[300],
            backgroundColor: WebflowPallette.neutral[900],
            centerTitle: false,
            elevation: 0,
            leading: IconButton(
              iconSize: 32,
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            title: Image(
              height: 24,
              image: AssetImage('assets/logos/webflow-logo-white.png'),
            ),
            actions: [
              IconButton(
                iconSize: 32,
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              Container(width: 6),
              IconButton(
                iconSize: 32,
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
              Container(width: 16)
            ],
          ),
      backgroundColor: backgroundColor ?? WebflowPallette.neutral[100],
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (header != null) header!,
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 24,
                ),
                child: Column(
                  children: children,
                ),
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends HookWidget {
  final List<Widget> children;

  AuthScreen({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      if (!UserNotifier.instance.validate().hasErrors)
        Navigator.pushReplacementNamed(context, '/');

      return () {};
    }, []);

    return Screen(
      backgroundColor: WebflowPallette.neutral,
      appBar: AppBar(
        foregroundColor: WebflowPallette.neutral[900],
        backgroundColor: WebflowPallette.neutral,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        title: Image(
          height: 24,
          image: AssetImage('assets/logos/webflow-logo-black.png'),
        ),
      ),
      children: [
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ],
    );
  }
}
