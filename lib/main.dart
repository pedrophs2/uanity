import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uanity/routes/app_routes.dart';
import 'package:uanity/routes/equipe_routes.dart';
import 'package:uanity/views/equipe/equipe.dart';
import 'package:uanity/views/equipe/equipe_form.dart';
import 'package:uanity/views/estoque/estoque.dart';
import 'package:uanity/views/home/home.dart';
import 'package:uanity/views/login/login.dart';

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
      home: const LoginView(),
      routes: {
        // Main Routes
        AppRoutes.login: (_) => const LoginView(),
        AppRoutes.home: (_) => const HomeView(),
        AppRoutes.estoque: (_) => const EstoqueView(),
        AppRoutes.equipe: (_) => const EquipeView(),

        //Equipe Routes
        EquipeRoutes.funcionarioRoute: (_) => const EquipeForm(),
      },
      builder: EasyLoading.init(),
    );
  }
}
