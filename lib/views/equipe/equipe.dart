import 'package:flutter/material.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/routes/equipe_routes.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';
import 'package:uanity/views/equipe/equipe_list_item.dart';

class EquipeView extends StatefulWidget {
  const EquipeView({Key? key}) : super(key: key);

  @override
  State<EquipeView> createState() => _EquipeViewState();
}

class _EquipeViewState extends State<EquipeView> {
  List<Usuario> usuarios = [];
  void _goToForm() {
    Navigator.of(context).pushNamed(EquipeRoutes.usuarioRoute);
  }

  Future<void> _populateUsuarios() async {
    List<Usuario> _usuarios = await UserController().listAll();

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
              ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  return EquipeListItem(
                    usuario: usuarios[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
