import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/entities/funcionario.dart';
import 'package:uanity/enums/cargo_enum.dart';

class EquipeForm extends StatefulWidget {
  const EquipeForm({Key? key}) : super(key: key);

  @override
  State<EquipeForm> createState() => _EquipeFormState();
}

class _EquipeFormState extends State<EquipeForm> {
  @override
  Widget build(BuildContext context) {
    final Funcionario? funcionario =
        ModalRoute.of(context)?.settings.arguments as Funcionario;

    final String title =
        funcionario != null ? funcionario.nome : 'Cadastro de Funcionário';

    TextEditingController nomeController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController cargoController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    populateForm() {
      if (funcionario != null) {
        nomeController.text = funcionario.nome;
        cpfController.text = funcionario.cpf;
        cargoController.text = (cargoLabels.containsKey(funcionario.cargo)
            ? cargoLabels[funcionario.cargo]
            : 'Não cadastrado')!;
        senhaController.text = funcionario.senha;
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
                  enabled: false,
                  controller: cargoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cargo',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
