import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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

    FormGroup _buildFormGroup() {
      if (widget.funcionario != null) {
        return FormGroup({
          'id': FormControl<String>(value: widget.funcionario!.id.toString()),
          'nome': FormControl<String>(value: widget.funcionario!.nome),
          'cpf': FormControl<String>(value: widget.funcionario!.cpf),
          'cargo': FormControl<int>(value: widget.funcionario!.cargo),
          'senha': FormControl<String>(value: widget.funcionario!.senha)
        });
      } else {
        return FormGroup({
          'id': FormControl<String>(),
          'nome': FormControl<String>(),
          'cpf': FormControl<String>(),
          'cargo': FormControl<String>(),
          'senha': FormControl<String>()
        });
      }
    }

    FormGroup formGroup = _buildFormGroup();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ReactiveForm(
              formGroup: formGroup,
              child: Column(
                children: [
                  ReactiveTextField(
                    formControlName: 'nome',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'cpf',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CPF',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                      formControlName: 'cargo',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cargo',
                      )),
                  const SizedBox(height: 10),
                  ReactiveTextField(
                    formControlName: 'senha',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
