import 'package:flutter/material.dart';

import 'presentation/pallette.dart';
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
            ),
            headline2: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 38,
            ),
            headline3: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 32,
            ),
            headline4: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            headline5: TextStyle(
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            headline6: TextStyle(
              fontFamily: 'Roboto',
              color: WebflowPallette.neutral[900],
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            bodyText1: TextStyle(
              color: WebflowPallette.neutral[900],
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              color: WebflowPallette.neutral[900],
              fontSize: 15,
            ),
            caption: TextStyle(
              fontFamily: 'Roboto',
              color: WebflowPallette.neutral[900],
              fontSize: 10,
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
          '/login': (_) => LogInScreen(),
          '/create-account': (_) => CreateAccountScreen(),
        },
      ),
    );
  }
}
