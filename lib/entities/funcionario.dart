import 'dart:convert';

class Funcionario {
  final int id;
  final String nome;
  final String cpf;
  final int cargo;
  final String senha;

  const Funcionario(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.cargo,
      required this.senha});

  String toJson() {
    var data = {
      'id': id,
      'name': nome,
      'cpf': cpf,
      'type': cargo,
      'password': senha
    };

    return jsonEncode(data);
  }

  static Funcionario fromJson(Map<String, dynamic> json) {
    return Funcionario(
      id: json['id'],
      nome: json['name'],
      cpf: json['cpf'],
      cargo: json['type'],
      senha: json['password'],
    );
  }
}
