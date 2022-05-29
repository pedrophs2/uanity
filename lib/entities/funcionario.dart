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
      'id': this.id,
      'nome': this.nome,
      'cpf': this.cpf,
      'cargo': this.cargo,
      'senha': this.senha
    };

    return jsonEncode(data);
  }
}
