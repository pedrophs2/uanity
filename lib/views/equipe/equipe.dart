import 'package:flutter/material.dart';
import 'package:uanity/entities/funcionario.dart';
import 'package:uanity/views/equipe/equipe_form.dart';
import 'package:uanity/views/equipe/equipe_list_item.dart';
import 'equipe_mock.dart';

class EquipeView extends StatefulWidget {
  const EquipeView({Key? key}) : super(key: key);

  @override
  State<EquipeView> createState() => _EquipeViewState();
}

class _EquipeViewState extends State<EquipeView> {
  void _goToForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const EquipeForm();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _goToForm,
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
                children: equipeMock.map((funcionario) {
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
