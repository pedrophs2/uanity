import 'package:flutter/material.dart';
import 'package:uanity/views/login.dart';

main() => runApp(const UanityApp());

class UanityApp extends StatelessWidget {
  const UanityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = const {
      50: Color.fromRGBO(4, 43, 73, .1),
      100: Color.fromRGBO(4, 43, 73, .2),
      200: Color.fromRGBO(4, 43, 73, .3),
      300: Color.fromRGBO(4, 43, 73, .4),
      400: Color.fromRGBO(4, 43, 73, .5),
      500: Color.fromRGBO(4, 43, 73, .6),
      600: Color.fromRGBO(4, 43, 73, .7),
      700: Color.fromRGBO(4, 43, 73, .8),
      800: Color.fromRGBO(4, 43, 73, .9),
      900: Color.fromRGBO(4, 43, 73, 1),
    };

    MaterialColor _customColors =
        MaterialColor(const Color.fromARGB(255, 4, 43, 73).value, colorCodes);

    return MaterialApp(
        theme: ThemeData(
          primaryColor: _customColors,
          primarySwatch: _customColors,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Uanity',
        home: const LoginView());
  }
}
