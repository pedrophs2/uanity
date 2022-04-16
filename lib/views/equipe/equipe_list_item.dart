import 'package:flutter/material.dart';
import 'package:uanity/entities/funcionario.dart';
import 'package:uanity/enums/cargo_enum.dart';
import 'package:uanity/views/equipe/equipe_form.dart';

class EquipeListItem extends StatelessWidget {
  final Funcionario funcionario;

  const EquipeListItem({Key? key, required this.funcionario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _openFuncionario(Funcionario funcionario) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return EquipeForm(funcionario: funcionario);
          },
        ),
      );
    }

    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () => _openFuncionario(funcionario),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    funcionario.nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${cargoLabels[funcionario.cargo]}'),
                        const SizedBox(height: 3),
                        Text(funcionario.cpf),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.chevron_right_sharp),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.chevron_right_sharp),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
