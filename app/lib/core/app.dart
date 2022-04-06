import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:more_go_stuff/modules/main_page.dart';
import 'package:more_go_stuff/modules/splash_page.dart';

final _buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'More go stuff',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.montserratTextTheme(),
        textButtonTheme: TextButtonThemeData(style: _buttonStyle),
        elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(style: _buttonStyle),
      ),
      routes: {
        SplashPage.route: (context) => const SplashPage(),
        MainPage.route: (context) => const MainPage(),
      },
    );
  }
}
