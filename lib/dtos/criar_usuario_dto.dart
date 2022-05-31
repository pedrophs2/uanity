import 'dart:convert';

class CriarUsuarioDTO {
  final String nome;
  final String cpf;
  final int cargo;
  final String senha;

  const CriarUsuarioDTO({
    required this.nome,
    required this.cpf,
    required this.cargo,
    required this.senha,
  });

  String toJson() {
    var data = {
      'name': nome,
      'cpf': cpf,
      'type': cargo,
      'password': senha,
    };

    return jsonEncode(data);
  }

  static CriarUsuarioDTO fromJson(Map<String, dynamic> json) {
    return CriarUsuarioDTO(
      nome: json['name'],
      cpf: json['cpf'],
      cargo: json['type'],
      senha: json['password'],
    );
  }
}
