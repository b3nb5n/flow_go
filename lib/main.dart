import 'package:flutter/material.dart';

import 'main/screens.dart';

void main() {
  runApp(App());
}

class WebflowPallette {
  static const webflowBlue = MaterialColor(
    0xFF4353FF,
    {
      300: Color(0xFF738CFF),
      400: Color(0xFF4D6BFF),
      500: Color(0xFF4353FF),
      600: Color(0xFF3545EE),
      700: Color(0xFF323ED1),
    },
  );

  static const neutral = MaterialColor(
    0xFFFFFFFF,
    {
      0: Color(0xFFFFFFFF),
      100: Color(0xFFE4E4E4),
      300: Color(0xFFBBBBBB),
      700: Color(0xFF444444),
      800: Color(0xFF2B2B2B),
      900: Color(0xFF000000),
    },
  );
}

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
