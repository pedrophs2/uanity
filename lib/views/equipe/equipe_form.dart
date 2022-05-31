import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uanity/dtos/criar_usuario_dto.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/enums/cargo_enum.dart';
import 'package:uanity/helpers/snack_helper.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';

class EquipeForm extends StatefulWidget {
  const EquipeForm({Key? key}) : super(key: key);

  @override
  State<EquipeForm> createState() => _EquipeFormState();
}

class _EquipeFormState extends State<EquipeForm> {
  @override
  Widget build(BuildContext context) {
    final Usuario? usuario = ModalRoute.of(context)?.settings.arguments != null
        ? ModalRoute.of(context)?.settings.arguments as Usuario
        : null;

    final String title =
        usuario != null ? usuario.nome : 'Cadastro de Funcionário';

    final bool editCargo = usuario == null;
    final int userId = usuario != null ? usuario.id : 0;

    TextEditingController nomeController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController cargoController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    populateForm() {
      if (usuario != null) {
        nomeController.text = usuario.nome;
        cpfController.text = usuario.cpf;
        senhaController.text = usuario.senha;

        cargoController.text = (cargoLabels.containsKey(usuario.cargo)
            ? cargoLabels[usuario.cargo]
            : 'Não cadastrado')!;
      }
    }

    createUser() async {
      CriarUsuarioDTO usuarioDTO = CriarUsuarioDTO(
        nome: nomeController.text,
        cpf: cpfController.text,
        cargo: int.parse(cargoController.text),
        senha: senhaController.text,
      );

      await UserController().createUser(usuarioDTO);
      SnackHelper().present(context, 'Usuário criado com sucesso !');
      Navigator.of(context).pop();
    }

    deleteUser() async {
      Response response = await UserController().deleteUser(userId);

      if (response.statusCode == 200) {
        SnackHelper().present(context, 'Usuário excluído com sucesso');
        Navigator.of(context).pop();
      }
    }

    WidgetsBinding.instance
        ?.addPostFrameCallback((timeStamp) => populateForm());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: cpfController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CPF',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  controller: senhaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  enabled: editCargo,
                  controller: cargoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cargo',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: createUser,
                    child: const Text('Salvar'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: deleteUser,
                    child: const Text('Excluir'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
