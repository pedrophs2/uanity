import 'package:flutter/material.dart';

class ColorsHelper {
  static const Map<int, Color> colorCodes = {
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

  static int mainColor = const Color.fromARGB(255, 4, 43, 73).value;
}
