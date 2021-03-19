import 'package:flow_go/presentation/pallette.dart';
import 'package:flutter/material.dart';

import 'presentation/screens.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flow Go',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: WebflowPallette.webflowBlue,
          fontFamily: 'Graphik',
          textTheme: TextTheme(
            headline1: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 50,
              height: 1.1,
            ),
            headline2: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 38,
              height: 1.2,
            ),
            headline3: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 32,
              height: 1.3,
            ),
            headline4: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.2,
            ),
            headline5: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 17,
              height: 1.2,
            ),
            headline6: TextStyle(
              fontFamily: 'Roboto',
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 1.3,
            ),
            bodyText1: TextStyle(
              color: WebflowPallette.neutral[900],
              fontSize: 16,
              height: 1.7,
            ),
            bodyText2: TextStyle(
              color: WebflowPallette.neutral[900],
              fontSize: 15,
              height: 1.6,
            ),
            caption: TextStyle(
              fontFamily: 'Roboto',
              color: WebflowPallette.neutral[900],
              fontSize: 10,
              height: 1.3,
            ),
            button: TextStyle(
              color: WebflowPallette.neutral,
              fontSize: 16,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: WebflowPallette.neutral[700],
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => Screen(Login()),
        },
      ),
    );
  }
}
