import 'dart:convert';

class LoginDTO {
  final String cpf;
  final String password;

  const LoginDTO({required this.cpf, required this.password});

  String toJson() {
    return jsonEncode({'cpf': cpf, 'password': password});
  }
}
