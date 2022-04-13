import 'package:flutter/material.dart';
import 'package:uanity/entities/funcionario.dart';

class EquipeForm extends StatefulWidget {
  final Funcionario? funcionario;
  const EquipeForm({Key? key, this.funcionario}) : super(key: key);

  @override
  State<EquipeForm> createState() => _EquipeFormState();
}

class _EquipeFormState extends State<EquipeForm> {
  @override
  Widget build(BuildContext context) {
    final String title = widget.funcionario != null
        ? widget.funcionario!.nome
        : 'Cadastro de Funcionário';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}
