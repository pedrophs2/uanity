import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/entities/usuario.dart';
import 'package:uanity/views/equipe/form/equipe_form.state.dart';
import 'package:uanity/views/equipe/form/widgets/cargo_input.widget.dart';
import 'package:uanity/views/equipe/form/widgets/cpf_input.widget.dart';
import 'package:uanity/views/equipe/form/widgets/create_user_button.widget.dart';
import 'package:uanity/views/equipe/form/widgets/delete_user_button.widget.dart';
import 'package:uanity/views/equipe/form/widgets/nome_input.widget.dart';
import 'package:uanity/views/equipe/form/widgets/password_input.widget.dart';

class EquipeForm extends StatefulWidget {
  const EquipeForm({Key? key}) : super(key: key);

  @override
  State<EquipeForm> createState() => _EquipeFormState();
}

class _EquipeFormState extends State<EquipeForm> {
  @override
  Widget build(BuildContext context) {
    var equipeFormState = EquipeFormState();
    var formGroup = equipeFormState.form;

    final Usuario? usuario =
        ModalRoute.of(context)?.settings.arguments as Usuario?;

    final String title =
        usuario != null ? usuario.nome : 'Cadastro de Funcionário';

    final int userId = usuario != null ? usuario.id : -1;

    populateForm() {
      if (usuario != null) {
        formGroup.controls['nome']?.value = usuario.nome;
        formGroup.controls['cpf']?.value = usuario.cpf;
        formGroup.controls['senha']?.value = usuario.senha;
        formGroup.controls['cargo']?.value = usuario.cargo;
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => populateForm());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: formGroup,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const NomeInputWidget(),
                    const SizedBox(height: 10),
                    const CpfInputWidget(),
                    const SizedBox(height: 10),
                    const PasswordInputWidget(),
                    const SizedBox(height: 10),
                    const CargoInputWidget(),
                    const SizedBox(height: 10),
                    const CreateUserButtonWidget(),
                    DeleteUserButtonWidget(
                      userId: userId,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
