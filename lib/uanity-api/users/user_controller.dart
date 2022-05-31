import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:uanity/dtos/criar_usuario_dto.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/uanity-api/api_specs.dart';

class UserController {
  Future<List<Usuario>> listAll() async {
    try {
      // EasyLoading.show();
      Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/user');

      Response response = await http.get(
        finalUri,
        headers: await ApiSpecs().getHeaders(),
      );

      var _usuarios = await jsonDecode(response.body);
      List<Usuario> listUsuarios = [];
      for (var usuario in _usuarios) {
        listUsuarios.add(Usuario.fromJson(usuario));
      }

      return listUsuarios;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<Usuario> createUser(CriarUsuarioDTO userDto) async {
    try {
      EasyLoading.show();
      Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/user');
      Response response = await http.post(
        finalUri,
        body: userDto.toJson(),
        headers: await ApiSpecs().getHeaders(),
      );

      var _usuarios = await jsonDecode(response.body);
      Usuario usuario = Usuario.fromJson(_usuarios);

      return usuario;
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<Response> deleteUser(int userId) async {
    try {
      EasyLoading.show();
      Uri finalUri = Uri.parse('${ApiSpecs.apiHost}/user/$userId');
      return await http.delete(
        finalUri,
        headers: await ApiSpecs().getHeaders(),
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
