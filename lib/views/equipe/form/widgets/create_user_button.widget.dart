import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uanity/dtos/criar_usuario_dto.dart';
import 'package:uanity/helpers/snack_helper.dart';
import 'package:uanity/uanity-api/users/user_controller.dart';

class CreateUserButtonWidget extends StatelessWidget {
  const CreateUserButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formGroup = ReactiveForm.of(context) as FormGroup;

    createUser() async {
      CriarUsuarioDTO usuarioDTO = CriarUsuarioDTO(
        nome: formGroup.value['nome'].toString(),
        cpf: formGroup.value['cpf'].toString(),
        cargo: int.parse(formGroup.value['cargo'].toString()),
        senha: formGroup.value['senha'].toString(),
      );

      await UserController().createUser(usuarioDTO);
      SnackHelper().present(context, 'Usuário criado com sucesso !');
      Navigator.of(context).pop();
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: createUser,
        child: const Text('Salvar'),
      ),
    );
  }
}
