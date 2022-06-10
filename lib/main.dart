import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uanity/helpers/colors_helper.dart';
import 'package:uanity/routes/app_routes.dart';
import 'package:uanity/routes/equipe_routes.dart';
import 'package:uanity/routes/produto_routes.dart';
import 'package:uanity/views/equipe/equipe.dart';
import 'package:uanity/views/equipe/equipe_form.dart';
import 'package:uanity/views/estoque/estoque.dart';
import 'package:uanity/views/estoque/produto_form.dart';
import 'package:uanity/views/home/home.dart';
import 'package:uanity/views/login/login.dart';

main() => runApp(const UanityApp());

class UanityApp extends StatelessWidget {
  const UanityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor _customColors = MaterialColor(
      ColorsHelper.mainColor,
      ColorsHelper.colorCodes,
    );

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

        // Equipe Routes
        EquipeRoutes.usuarioRoute: (_) => const EquipeForm(),

        // Produto Routes
        ProdutoRoutes.cadastroRoute: (_) => const ProdutoForm()
      },
      builder: EasyLoading.init(),
    );
  }
}
