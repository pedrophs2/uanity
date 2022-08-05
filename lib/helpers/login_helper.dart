import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uanity/dtos/login_dto.dart';
import 'package:uanity/helpers/snack_helper.dart';
import 'package:uanity/routes/app_routes.dart';
import 'package:uanity/uanity-api/auth/auth_controller.dart';

class LoginHelper {
  static const int successStatusCode = 201;

  login(LoginDTO loginDto, BuildContext context) async {
    var res = await AuthController().login(loginDto);

    if (res.statusCode == successStatusCode) {
      const storage = FlutterSecureStorage();
      var authDto = jsonDecode(res.body);
      await storage.write(key: 'token', value: authDto['token']);

      print(authDto);

      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } else {
      SnackHelper().present(context, 'CPF ou senha incorretos');
    }
  }
}
