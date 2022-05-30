import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uanity/routes/equipe_routes.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';
import 'package:uanity/views/equipe/equipe_list_item.dart';
import '../../entities/funcionario.dart';

class EquipeView extends StatefulWidget {
  const EquipeView({Key? key}) : super(key: key);

  @override
  State<EquipeView> createState() => _EquipeViewState();
}

class _EquipeViewState extends State<EquipeView> {
  List<Funcionario> usuarios = [];
  void _goToForm() {
    Navigator.of(context).pushNamed(EquipeRoutes.funcionarioRoute);
  }

  Future<void> _populateUsuarios() async {
    var response = await UserController().listAll();
    var _jsonUsuarios = await jsonDecode(response.body);
    usuarios = [];

    List<Funcionario> _usuarios = [];
    for (var usuario in _jsonUsuarios) {
      _usuarios.add(Funcionario.fromJson(usuario));
    }

    setState(() {
      usuarios = _usuarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) async => await _populateUsuarios());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Funcionários'),
        actions: [
          IconButton(
            onPressed: _goToForm,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do funcionário',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: usuarios.map((funcionario) {
                  return EquipeListItem(funcionario: funcionario);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
